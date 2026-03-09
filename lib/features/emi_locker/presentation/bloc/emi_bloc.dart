import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/emi_repository_impl.dart';
import '../../../../services/device_policy_service.dart';

import 'emi_event.dart';
import 'emi_state.dart';

class EmiBloc extends Bloc<EmiEvent, EmiState> {

  final EmiRepositoryImpl repository;
  final DevicePolicyService devicePolicyService;

  EmiBloc(this.repository, this.devicePolicyService) : super(EmiInitial()) {

    on<FetchEmis>((event, emit) async {

      emit(EmiLoading());

      try {

        final emis = await repository.getEmiStatus(
          event.userId,
          event.token,
        );

        if (emis.any((e) => e.status == "pending")) {

          await devicePolicyService.lockDevice();

          emit(EmiLocked());

        } else {

          emit(EmiLoaded(emis));

        }

      } catch (e) {

        emit(EmiError(e.toString()));

      }
    });
  }
}