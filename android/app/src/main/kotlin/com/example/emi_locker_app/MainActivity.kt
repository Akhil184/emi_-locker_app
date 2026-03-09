package com.example.emi_locker_app

import android.app.admin.DevicePolicyManager
import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "emi/device_policy"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                if (call.method == "lockDevice") {

                    val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager

                    dpm.lockNow()

                    result.success(null)

                } else {
                    result.notImplemented()
                }
            }
    }
}