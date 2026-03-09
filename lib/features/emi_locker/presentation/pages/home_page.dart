import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/api/api_service.dart';
import '../../data/repository/emi_repository_impl.dart';

import '../bloc/emi_bloc.dart';
import '../bloc/emi_event.dart';
import '../bloc/emi_state.dart';

import '../../../../services/device_policy_service.dart';
import 'lock_screen_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  late EmiBloc emiBloc;

  @override
  void initState() {
    super.initState();

    emiBloc = EmiBloc(
      EmiRepositoryImpl(ApiService()),
      DevicePolicyService(),
    );

    fetchEmi();
  }

  Future<void> fetchEmi() async {

    final token = await storage.read(key: "token");
    final userId = await storage.read(key: "userId");

    if (token != null && userId != null) {

      emiBloc.add(
        FetchEmis(userId, token),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => emiBloc,
      child: Scaffold(

        appBar: AppBar(
          title: const Text("EMI Locker"),
        ),

        body: BlocBuilder<EmiBloc, EmiState>(
          builder: (context, state) {

            if (state is EmiLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is EmiLocked) {
              return const LockScreenPage();
            }

            if (state is EmiLoaded) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 70,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Device Active",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is EmiError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}