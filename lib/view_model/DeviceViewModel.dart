import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';

import '../model/DeviceInfoModel.dart';

class DeviceInfoViewModel extends ChangeNotifier {
  DeviceInfoModel? _deviceInfo;

  DeviceInfoModel? get deviceInfo => _deviceInfo;

  Future<void> fetchDeviceInfo() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (kIsWeb) {
        // Handle web platform
        // You can provide default values for web or handle it differently
        _deviceInfo = DeviceInfoModel(
          deviceId: 'Web Device ID',
          deviceName: 'Web Device',
          deviceModel: 'Web Model',
        );
      } else {
        if (defaultTargetPlatform == TargetPlatform.android) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          _deviceInfo = DeviceInfoModel(
            deviceId: androidInfo.androidId,
            deviceName: androidInfo.device,
            deviceModel: androidInfo.model,
          );
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          _deviceInfo = DeviceInfoModel(
            deviceId: iosInfo.identifierForVendor,
            deviceName: iosInfo.name,
            deviceModel: iosInfo.model,
          );
        }
      }
      notifyListeners();
    } catch (error) {
      print('Error fetching device info: $error');
    }
  }
}
