package com.example.emi_locker_app

import android.app.admin.DevicePolicyManager
import android.content.ComponentName
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

                val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager

                val admin = ComponentName(
                    this,
                    DeviceAdminReceiverImpl::class.java
                )

                when (call.method) {

                    "lockDevice" -> {
                        dpm.lockNow()
                        result.success("Device Locked")
                    }

                    "blockUninstall" -> {
                        dpm.setUninstallBlocked(
                            admin,
                            packageName,
                            true
                        )
                        result.success("Uninstall Blocked")
                    }

                    "startKioskMode" -> {
                        dpm.setLockTaskPackages(
                            admin,
                            arrayOf(packageName)
                        )
                        startLockTask()
                        result.success("Kiosk Mode Started")
                    }

                    else -> result.notImplemented()
                }
            }
    }
}