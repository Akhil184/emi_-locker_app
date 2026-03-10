# EMI Locker Application

## Overview

EMI Locker is an Android Enterprise based device control application developed using Flutter and Kotlin platform channels. The application enforces device-level policies using **Device Owner (Fully Managed Device mode)** to ensure that devices remain locked when EMI payments are pending.

The system integrates with backend APIs to verify EMI status and automatically applies restrictions such as device lock, uninstall protection, and kiosk mode.

---

## Key Features

* Device Owner (Android Enterprise Fully Managed Mode)
* EMI status verification via REST API
* Automatic device lock when EMI is pending
* Kiosk Mode (Single App Mode)
* Uninstall protection
* Lock screen overlay UI
* QR Code enrollment provisioning
* Secure token storage

---

## Tech Stack

**Frontend**

* Flutter
* Dart
* BLoC State Management

**Android Native**

* Kotlin
* DevicePolicyManager
* Android Enterprise APIs

**Backend Integration**

* REST APIs
* Secure token storage using Flutter Secure Storage

---

## Architecture

The project follows a clean architecture approach.

lib/

core/

* api

data/

* repository

presentation/

* bloc
* pages

services/

* device_policy_service

---

## Device Owner Setup (Testing)

Install the application and set it as Device Owner using ADB.

```
adb shell dpm set-device-owner com.example.emi_locker_app/.DeviceAdminReceiverImpl
```

Verify device owner:

```
adb shell dpm list-owners
```

---

## Kiosk Mode

The application enables single-app kiosk mode using Android DevicePolicyManager.

Policies enforced:

* Lock task mode
* Disable uninstall
* Restrict system navigation

---

## EMI Lock Flow

Application workflow:

1. User logs into the app
2. App fetches EMI status from backend
3. If EMI status is pending
4. Device is locked using DevicePolicyManager
5. Lock screen UI is displayed

---

## Lock Screen UI

When EMI is pending the device shows a restricted screen displaying:

* Device Locked message
* EMI payment reminder
* Optional Pay EMI button

---

## QR Enrollment Provisioning

The application supports Android Enterprise QR based enrollment during device setup.

Provisioning configuration is stored in:

```
docs/qr_enrollment.json
```

Example configuration:

```
{
  "android.app.extra.PROVISIONING_DEVICE_ADMIN_COMPONENT_NAME": "com.example.emi_locker_app/.DeviceAdminReceiverImpl",
  "android.app.extra.PROVISIONING_DEVICE_ADMIN_PACKAGE_DOWNLOAD_LOCATION": "https://yourserver.com/emi_locker_app.apk",
  "android.app.extra.PROVISIONING_DEVICE_ADMIN_PACKAGE_CHECKSUM": "BASE64_CHECKSUM",
  "android.app.extra.PROVISIONING_SKIP_ENCRYPTION": true
}
```

---

## QR Enrollment Flow

1. Factory reset Android device
2. Start device setup
3. Tap screen 6 times
4. Android QR scanner opens
5. Scan provisioning QR code
6. Device automatically installs EMI Locker
7. App becomes Device Owner

---

## API Integration

Example API endpoints:

Login API

```
POST /auth/admin/login
```

EMI Status API

```
GET /emis
```

---

## Build APK

To generate the release APK:

```
flutter build apk --release
```

APK location:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## Security Policies

The application enforces the following device restrictions:

* Prevent uninstall
* Force device lock
* Enable kiosk mode
* Restrict navigation

---

## Deliverables

* Source Code
* APK Build
* API Integration
* QR Enrollment Configuration
* Documentation

---

## Conclusion

The EMI Locker application demonstrates Android Enterprise device management capabilities including device owner provisioning, kiosk mode enforcement, remote device locking based on EMI payment status, and enterprise enrollment via QR provisioning.
