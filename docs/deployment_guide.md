# EMI Locker Application – Deployment Guide

## 1. Overview

This document provides the deployment steps for the **EMI Locker Application**, developed using Flutter with Android Enterprise Device Owner capabilities. The application enforces device-level security policies such as uninstall restriction, kiosk mode, and device locking when EMI payments are pending.

The guide explains how to install, configure, and test the application on an Android device.

---

## 2. System Requirements

Before deploying the application, ensure the following prerequisites are available:

* Android device running **Android 8.0 (API 26) or higher**
* USB debugging enabled on the device
* **Android Debug Bridge (ADB)** installed on the computer
* EMI Locker **release APK**
* Internet connection for API communication

To verify device connectivity run:

```
adb devices
```

If the device is connected successfully, it will appear in the device list.

---

## 3. Application Installation

Install the EMI Locker APK on the Android device using ADB.

```
adb install app-release.apk
```

After successful installation, the application will be available on the device launcher.

---

## 4. Configure Device Owner Mode

The application requires **Device Owner (Fully Managed Device Mode)** to enforce enterprise security policies such as uninstall restriction and kiosk mode.

Run the following command:

```
adb shell dpm set-device-owner com.example.emi_locker_app/.DeviceAdminReceiverImpl
```

If the command executes successfully, the application becomes the **Device Owner** of the device.

To verify Device Owner configuration:

```
adb shell dpm list-owners
```

The output should show the EMI Locker application as the **device owner**.

---

## 5. Launch the Application

Open the **EMI Locker Application** from the device.

When launched, the application performs the following actions:

* Connects to backend APIs
* Fetches EMI payment status
* Applies device security policies
* Enables kiosk mode if required

---

## 6. Security Policy Enforcement

Once the application is running in Device Owner mode, the following policies are enforced:

* Application uninstall restriction
* Device kiosk mode activation
* System navigation restrictions
* Device lock when EMI payment is pending

These policies ensure that the device remains controlled by the enterprise application.

---

## 7. EMI Lock Workflow Testing

To verify the EMI locker functionality:

1. Launch the EMI Locker application.
2. Login or trigger EMI status verification.
3. The application sends a request to the backend API.
4. If EMI status is **Pending**, the device automatically enters locked mode.

Expected behavior:

* Lock screen overlay is displayed
* User cannot exit the application
* Navigation controls are restricted

Once EMI payment is completed, the device can be unlocked.

---

## 8. QR Enrollment Provisioning (Enterprise Deployment)

The application also supports **Android Enterprise QR-based device enrollment**.

This method allows automatic provisioning of the device during initial setup.

### Steps

1. Perform a **factory reset** on the Android device.
2. Start the Android device setup process.
3. On the setup screen, **tap the screen six times**.
4. The Android QR provisioning scanner will open.
5. Scan the enrollment QR code generated from the provisioning configuration.

After scanning the QR code:

* EMI Locker application is downloaded automatically
* Application is installed on the device
* Device Owner mode is configured
* Enterprise policies are applied automatically

This method is commonly used for enterprise device deployments.

---

## 9. Troubleshooting

### Device Owner Already Set

If the following error appears during configuration:

```
Error: Device owner already set
```

Solution:

* Perform a **factory reset** on the device.
* Run the Device Owner command again.

---

### Device Not Detected

If the device does not appear when running:

```
adb devices
```

Ensure the following:

* USB debugging is enabled
* Developer options are enabled
* USB cable is connected properly

---

### Kiosk Mode Not Working

Verify that the application is correctly configured as Device Owner by running:

```
adb shell dpm list-owners
```

If the application is not listed, repeat the Device Owner setup step.

---

## 10. Deployment Package Contents

The final deployment package includes:

* EMI Locker Application APK
* Source Code
* Project README Documentation
* QR Enrollment Configuration File
* Deployment Guide

---

## 11. Conclusion

The EMI Locker application demonstrates enterprise-level Android device management using **Device Owner provisioning**, **kiosk mode enforcement**, and **EMI-based device locking**. This deployment guide outlines the required steps to install, configure, and verify the application in a controlled Android environment.
