class SocketConstants {
  //Default events
  static const String eventConnect = "connect";
  static const String eventDisconnect = "disconnect";
  static const String eventConnectTimeout = "connect_timeout";
  static const String onSocketError = "onSocketError";

  //Video Call  events
  static const String createPrivateRoom = "createPrivateRoom";
  static const String joinRoom = "joinRoom"; //channel id token
  static const String leaveRoom = "leaveRoom";
  static const String removeMessage = "removeMessage";  //user recieve call
  static const String sendMessage = "sendMessage";
  static const String typeMessage = "typeMessage";
  static const String onRejectCall = "onRejectCall";
}
