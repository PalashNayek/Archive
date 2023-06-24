import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:s2w/widget/custom_snackbar.dart';
import '../api/api_const.dart';
import 'app_local_data_util.dart';

class ApiClient with RouteAware {
  final String baseUrl = "${APIConst.baseUrl}";
  Map<String, String>? _headers;
  static StreamController<dynamic> validationErrorStreamController =
      StreamController.broadcast();
  static BuildContext? currentContext;
  static int _overlayCount = 0;
  static OverlayEntry? _overlay;

  getToken() async {
   await AppLocalDataUtil().getToken().then((value){
     if(value==null) {
       _headers = {
         'Content-Type': 'application/json; charset=UTF-8',
         'Authorization': "Bearer " '',
         'Date': DateTime.now().toUtc().toString(),
       };
     }else{
       _headers = {
         'Content-Type': 'application/json; charset=UTF-8',
         'Authorization': "Bearer " + value ?? '',
         'Date': DateTime.now().toUtc().toString(),
       };
     }
   });

    //   print(_headers);
  }

  Future<http.Response> postRequest(String url, String content) async {
    await getToken();
    return http.post(Uri.parse(baseUrl + url), body: content, headers: _headers).then(
      (response) {
        return _responseManager(response);
      },
    ).catchError((e) {
      print(e);
    });
  }
 Future<bool> multipartImageUploadPOST(String url, File image) async {
    await getToken();
    print("URL:- "+baseUrl + url);
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl + url),
    );
    request.headers.addAll(_headers!);
    var multipartFile = await http.MultipartFile.fromPath('file', image.path,contentType:  MediaType("image", "jpg")); //returns a Future<MultipartFile>
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    var jsonData = jsonDecode(respStr);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
      // error
    }
  }
  Future<bool> multipartVideoUploadPOST(String url, File image) async {
    await getToken();
    print("URL:- "+baseUrl + url);
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl + url),
    );
    request.headers.addAll(_headers!);
    var multipartFile = await http.MultipartFile.fromPath('file', image.path,contentType:  MediaType("video", "mp4")); //returns a Future<MultipartFile>
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    var jsonData = jsonDecode(respStr);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
      // error
    }
  }
  Future<String> getPostRequest(String url) async {
    await getToken();
    print("URL:- "+baseUrl + url);
    Map<String, String>? _body;
    var request = http.MultipartRequest(
      'GET',
      Uri.parse(baseUrl + url),
    );
    _body={
      "limit":"10",
      "offset":"0",
      "keyword":"",
      "type":"Group"
    };
    request.headers.addAll(_headers!);
    request.fields.addAll(_body!);
    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    var jsonData = jsonDecode(respStr);
    if (response.statusCode == 200) {
      return jsonData;
    } else {
      return jsonData;
      // error
    }
  }
  Future<bool> multipartImageUpload(String url, File image) async {
    await getToken();
    print("URL:- "+baseUrl + url);
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(baseUrl + url),
    );
    request.headers.addAll(_headers!);
    var multipartFile = await http.MultipartFile.fromPath(
        'file', image.path,contentType:  MediaType("image", "jpg")); //returns a Future<MultipartFile>
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    var jsonData = jsonDecode(respStr);

   if (response.statusCode == 200) {
      return true;
    } else {
      return false;
      // error
    }
  }

  Future<http.Response> postLoginRequest(String url, String content) async {
    _headers = {
      'Content-Type': 'application/json; charset=UTF-8',
     // 'Date': DateTime.now().toUtc().toString(),
    };
    print("URL:- "+baseUrl + url);
    return http.post(Uri.parse(baseUrl + url), body: content,headers: _headers).then(
          (response) {

            print("HelloMyRes"+response.body.toString());
        return _responseManager(response);
      },
    ).catchError((e) {
      print("API Error:-"+e.toString());
      return e;
     // print("API Error:-"+e.toString());
    });
  }


  Future<http.Response> getRequest(String url, String content,
      {required bool isCompleteUrl}) async {
    await getToken();
    print("urlPalash"+baseUrl + url + content);
    return http.get((isCompleteUrl == null || isCompleteUrl == false)
                ? Uri.parse(baseUrl + url + content)
                :Uri.parse(baseUrl+url + content), headers: _headers)
        .then((response) async {
        return _responseManager(response);
      },
    ).catchError(_onUnknownError);
  }

  Future<http.Response> putRequest(String url, String content) async {
    await getToken();
    Map<String, String> extraHeaders = Map.from(_headers!);
    print(extraHeaders.toString());
    return http.put(Uri.parse(baseUrl + url), body: content, headers: extraHeaders).then(
      (response) {
        print(response.statusCode);
        return _responseManager(response);
      },
    ).catchError(_onUnknownError);
  }
  Future<http.Response> patchRequest(String url, String content) async {
    await getToken();
    Map<String, String> extraHeaders = Map.from(_headers!);
    print(extraHeaders.toString());
    return http.patch(Uri.parse(baseUrl + url), body: content, headers: extraHeaders).then(
          (response) {
        print(response.statusCode);
        return _responseManager(response);
      },
    ).catchError(_onUnknownError);
  }

  Future<http.Response> deleteRequest(String url, String content) async {
    print("DeleteURL "+baseUrl+url+content);

    await getToken();
    Map<String, String> extraHeaders = Map.from(_headers!);
    return http.delete(Uri.parse(baseUrl+url+content), headers: extraHeaders).then(
      (response) {

        return _responseManager(response);
      },
    ).catchError(_onUnknownError);
  }

  http.Response _responseManager(http.Response response) {

    if (response.statusCode == 200) {
      return response;
    }else if (response.statusCode == 201) {
      return response;
    }else if (response.statusCode == 400) {
      var errors = json.decode(response.body);
     // validationErrorStreamController.add(errors['message']);
     // throw new ValidationException(errors);
      print(errors["message"]);
      // Fluttertoast.showToast(
      //     backgroundColor: Colors.red.shade700,
      //     textColor: Colors.white,
      //     msg: errors["message"][0].toString());
    } else if (response.statusCode == 401) {
      return response;
      /*var errors = json.decode(response.body);

      throw errors;*/
      /*AppLocalDataUtil().removeToken();
      Navigator.of(currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => LoginScreen()),
          (Route<dynamic> route) => false);*/

    } else if (response.statusCode == 409) {
      var errors = json.decode(response.body);
      /*Fluttertoast.showToast(
          backgroundColor: Colors.red.shade700,
          textColor: Colors.white,
          msg: errors['message']);*/
     // throw errors;
      return response;
    } else if (response.statusCode == 430) {
      //throw new RedirectionException(response.body);
    } else if (response.statusCode == 403) {
     // Fluttertoast.showToast(msg: response.body);
     // throw new PrivilegeException(response.body);
    } else if (response.statusCode == 404) {
      var errors = json.decode(response.body);
    //  Fluttertoast.showToast(msg: errors['message']);
      throw errors;
    } else if (response.statusCode == 500) {
      var errors = json.decode(response.body);
      //showCustomSnackBar( "Username Required",context);
     // Fluttertoast.showToast(msg:"Sorry we are unable to process now!");
      throw errors;
    }else {
      //Fluttertoast.showToast(msg: response.body);
      //throw new ServerException(response.body);
    }
    return response;
  }

  _onUnknownError(error) {
   // _hideOverLay();
    print(error.toString());
    if (error is SocketException) {
      // Fluttertoast.showToast(
      //     backgroundColor: Colors.red.shade700,
      //     textColor: Colors.white,
      //     msg: error.message + " Check Your Internet Connection.");
      //   SystemNavigator.pop();
      return;
    }
    throw error;
  }


  @override
  void didPopNext() {
  //  _hideOverLay();
  }
}
