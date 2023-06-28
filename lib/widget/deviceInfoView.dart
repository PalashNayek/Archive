import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/DeviceViewModel.dart';

class DeviceInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceInfoViewModel viewModel = Provider.of<DeviceInfoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Device Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Device ID: ${viewModel.deviceInfo?.deviceId ?? 'N/A'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Device Name: ${viewModel.deviceInfo?.deviceName ?? 'N/A'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Device Model: ${viewModel.deviceInfo?.deviceModel ?? 'N/A'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
