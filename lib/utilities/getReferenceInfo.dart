import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
class GetRef extends StatelessWidget {
  const GetRef({Key? key}) : super(key: key);

  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(BuildContext as BuildContext).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // Returns the device ID for iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // Returns the device ID for Android
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
