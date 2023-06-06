import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s2w/api/api_const.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:socket_io_client/socket_io_client.dart';
import 'model/res_call_request_model.dart';
import 'socket_constants.dart';

io.Socket ? _socketInstance;
BuildContext? buildContext;

//Initialize Socket Connection
dynamic initSocketManager(BuildContext context,String id,String accountId) {

  buildContext = context;
  print("userid----"+accountId.toString());
  if (_socketInstance != null) return;
  _socketInstance = io.io(APIConst.socketUrl,
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect()
          .setExtraHeaders({'authorization':"Bearer "+id,'accountId':accountId})
          .build()
  );
   print("Token----"+id.toString());
  _socketInstance!.connect();
  socketGlobalListeners();
}

//Socket Global Listener Events
dynamic socketGlobalListeners() {

  _socketInstance!.on(SocketConstants.eventConnect, onConnect);
  _socketInstance!.on(SocketConstants.eventDisconnect, onDisconnect);
  _socketInstance!.on(SocketConstants.onSocketError, onConnectError);
  _socketInstance!.on(SocketConstants.eventConnectTimeout, onConnectError);
// _socketInstance!.on(SocketConstants.onCallRequest, handleOnCallRequest);
}

//To Emit Event Into Socket
bool emit(String event, Map<String, dynamic> data) {
 print("===> emit $data");
  _socketInstance!.emit(event, jsonDecode(json.encode(data)));
  return _socketInstance!.connected;
}
bool emit2(String event, String s) {

  _socketInstance!.emit(event, s);
  return _socketInstance!.connected;
}
//Get This Event After Successful Connection To Socket
dynamic onConnect(_) {
print("===> connected socket....................");
}

//Get This Event After Connection Lost To Socket Due To Network Or Any Other Reason
dynamic onDisconnect(_) {
  print("Disconnect");
 // ConsoleLogUtils.printLog("===> Disconnected socket....................");
}

//Get This Event After Connection Error To Socket With Error
dynamic onConnectError(error) {
  print("===> ConnectError socket.................... $error");
}

//Get This Event When Someone Received Call From Other User
void handleOnCallRequest(dynamic response) {
 print("===>socket Response .................... $response");
  if (response != null) {
    final data = ResCallRequestModel.fromJson(response);

  }
}

