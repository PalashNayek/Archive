import 'package:shared_preferences/shared_preferences.dart';

class AppLocalDataUtil {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authKey");
    print(token);
    return token;
  }
  Future<bool?> getOnBoard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? onboard = prefs.getBool("onboard");
    return onboard;
  }
  Future<String?> getMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mobile = prefs.getString("mobile");
    return mobile;
  }
  Future<bool> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("authKey", token);
  }
  Future<bool> setOnBoard(bool onboard) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("onboard", onboard);
  }
  Future<bool> setMobile(String mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("mobile", mobile);
  }
  Future<bool> setAgoraToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("agoraToken", token);
  }
  Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("authKey");
  }



  Future<String?> getUdid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("udid");
  }

  Future<bool> setUdid(String udid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("udid", udid);
  }

  Future<bool> removeUdid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("udid");
  }

  Future<bool> getAgreement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("agree") ?? false;
  }

  Future<bool> setAgreement(bool flag) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("agree", flag);
  }

  Future<bool> removeAgreement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("agree");
  }

  Future<String?> getSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lang") ?? null;
  }

  Future<bool> setSelectedLanguage(String flag) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("lang", flag);
  }

  Future<bool> removeSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("lang");
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("userId") ?? null;
  }

  Future<bool> setUserId(int flag) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("userId", flag);
  }

  Future<bool> removeUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("userId");
  }
}
