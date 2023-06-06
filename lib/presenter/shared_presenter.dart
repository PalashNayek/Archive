import 'dart:convert';
import 'dart:io';
import 'package:s2w/models/interest_list_model.dart';

import '../models/banner_model.dart';
import '../models/page_model.dart';
import '../services/shared_service.dart';

class SharedPresenter {
  SharedService? _sharedService;

  SharedPresenter() {
    _sharedService = SharedService();
  }
  Future<List<BannerModel>> getBanner() {
    return _sharedService!.getBanner("");
  }
  Future<PageModel> getPage(int i) {
    return _sharedService!.getPage(i);
  }
  Future<List<InterestListModel>> getInterest() {
    return _sharedService!.getInterest("");
  }
 /* // Pick Files
  Future<File> pickFiles(BuildContext context, String selectionType,
      {FileType fileType}) async {
    if (selectionType == AppConstConfig.selectCamera) {
      File img ; *//*await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 60);*//*

      if (img != null && img is File) {
        return File(img.path);
      } else {
        return null;
      }
    } else if (selectionType == AppConstConfig.selectGallery) {
      String filePath;
      FilePickerResult result =
          await FilePicker.platform.pickFiles(type: fileType ?? FileType.any);
      if (result?.files?.length > 0) {
        filePath = result?.files[0].path;
      }
      return filePath == null ? null : File(filePath);
    } else {
      return null;
    }
  }

  // Encode File to Base64 and Organize Information
  FileInfo getFileContent(File file) {
    if (file != null) {
      String fileNameWithExt = file.path.split("/").last;
      String fileName = fileNameWithExt.split(".").first;
      String extention = fileNameWithExt.split(".").last;

      FileInfo fileInfo =
          new FileInfo(fileName: fileName, extention: extention);
      fileInfo.encodedContent = fileToBase64(file);
      return fileInfo;
    } else {
      return null;
    }
  }

  String fileToBase64(File file) {
    if (file != null) {
      return base64Encode(file.readAsBytesSync());
    } else {
      return null;
    }
  }

  // Download media and files
  Future<void> downloadMedia(
      {@required int id,
      @required String mediaUrl,
      @required String mediaName,
      @required String mediaType,
      bool isDirect,
      Function onProgressFunction,
      Function onPermissionDeny,
      Map<String, dynamic> params,
      @required postDownloadFunction}) async {
    String path = await getDownloadDir(onPermissionDeny);
    if (path != null) {
      _sharedService.downloadMedia(
          id: id,
          mediaName: mediaName,
          mediaUrl: mediaUrl,
          isDirect: isDirect,
          mediaType: mediaType,
          downloadPath: path,
          params: params,
          onProgressFunction: onProgressFunction,
          postDownloadFunction: postDownloadFunction);
    }
  }

  Future<String> getDownloadDir(Function popupFunc) async {
    bool flag = false;
    if (!await AppPermissionUtil.checkPermission(Permission.storage)) {
      if (await AppPermissionUtil.requestPermission(Permission.storage)) {
        flag = true;
      } else {
        if (popupFunc != null) {
          popupFunc();
        }
        flag = false;
      }
    } else {
      flag = true;
    }

    if (flag) {
      String path = "${await findLocalPath()}/Download/asklepia_health_doctor";
      await Directory(path).create(recursive: true);
      return path;
    } else {
      return null;
    }
  }

  Future<String> findLocalPath() async {
    if (Platform.isAndroid) {
      return (await getExternalStorageDirectory()).path;
    } else {
      return (await getApplicationDocumentsDirectory()).path;
    }
  }

  Future<List<BookingModel>> getStatementList(String id, String startDate, String endDate) {
    return _sharedService.getStatementList(id,startDate, endDate);
  }

  Future<void> downloadStatement(
    int id,
    Map<String, dynamic> params,
    Function postDownloadFunc,
    Function onProgress,
  ) {
    return _sharedService.downloadStatement(
        id: id,
        ext: "csv",
        params: params,
        postDownloadFunction: postDownloadFunc,
        onPermissionDeny: () {
          Fluttertoast.showToast(msg: "Permission denied by user");
        },
        onProgressFunction: onProgress);
  }

  Future<List<MedicineModel>> getMedSuggestion(String keyword) {
    return _sharedService.getMedSuggestion(keyword);
  }*/
}
