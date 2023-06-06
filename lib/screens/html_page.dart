import 'package:flutter/material.dart';
//import 'package:flutter_html/flutter_html.dart';

import '../models/page_model.dart';
import '../presenter/shared_presenter.dart';
import '../theme/color.dart';

class HTMLPage extends StatefulWidget {
  HTMLPage(this.i,this.title);
  final int i;
  final String title;
  @override
  _HTMLPageState createState() => new _HTMLPageState();
}



class _HTMLPageState extends State<HTMLPage> {
  bool load=false;
  PageModel pageModel= new PageModel();
  SharedPresenter sharedPresenter= SharedPresenter();
  @override
  void initState() {
    super.initState();

    getData();
  }
  void getData(){
    sharedPresenter.getPage(widget.i).then((value) {
      pageModel=value;
      load=true;
      setState(() {

      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text( widget.title),
        centerTitle: true,
        backgroundColor: primary,
      ),
      body: SingleChildScrollView(
        child: load?Container() /*Html(
          data: pageModel.desc,
        )*/:Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}