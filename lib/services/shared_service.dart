import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:s2w/models/banner_model.dart';
import 'package:s2w/models/interest_list_model.dart';

import '../models/page_model.dart';
import '../utilities/api-client.dart';


class SharedService extends ApiClient {
  String _bannerUrl = "slider/list?limit=10&offset=0&keyword=0&status=Active";
  String _interestUrl = "interests/list?limit=30&offset=0&keyword=&status=Active";
  String _pageUrl="pages/";


  Future<List<BannerModel>> getBanner(String keyword) {

    return getRequest(_bannerUrl+keyword, "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);

        Iterable iterable = result["result"];
        return iterable
            .map((element) => BannerModel.fromJson(element))
            .toList();
      } else {
        return [];
      }
    });
  }


  Future<List<InterestListModel>> getInterest(String keyword) {
    print("object");

    return getRequest(_interestUrl+keyword, "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);

        Iterable iterable = result["result"];
        return iterable
            .map((element) => InterestListModel.fromJson(element))
            .toList();
      } else {
        return [];
      }
    });
  }


  Future<PageModel> getPage(int i) {

    return getRequest(_pageUrl+i.toString(), "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        PageModel pageModel= PageModel.fromJson(result);

        return pageModel;
      } else {
        return PageModel();
      }
    });
  }
 /* Future<void> downloadStatement(
      {@required int id,
      String fileName,
      String ext,
      Function onProgressFunction,
      Function onPermissionDeny,
      Map<String, dynamic> params,
      @required postDownloadFunction}) async {
    SharedPresenter sharedPresenter = new SharedPresenter();
    String path = await sharedPresenter.getDownloadDir(onPermissionDeny);
    if (path != null) {
      sharedPresenter.downloadMedia(
          id: id,
          mediaUrl: "$_statementDownloadUrl",
          mediaName:
              "statement_${AppCommonHelper.formatDate(DateTime.now().toString(), dateFormat: 'dd-MM-yyyy-hh-mm-ss')}",
          mediaType: ext ?? "csv",
          params: params,
          onProgressFunction: onProgressFunction,
          postDownloadFunction: postDownloadFunction);
    }
  }*/
}
