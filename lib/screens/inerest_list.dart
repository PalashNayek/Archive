import 'package:flutter/material.dart';

import '../widget/interest_item.dart';

class InterestListWidget extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    List<String> allIcon=[];
    List<String> allName=[];
    allIcon.add("assets/page-1/images/category1.png");
    allIcon.add("assets/page-1/images/category2.png");
    allIcon.add("assets/page-1/images/category3.png");
    allIcon.add("assets/page-1/images/category4.png");
    allIcon.add("assets/page-1/images/category3.png");
    allIcon.add("assets/page-1/images/category4.png");

    allName.add("Cricket");
    allName.add("Football");
    allName.add("Tenis");
    allName.add("Hocky");
    allName.add("Cricket");
    allName.add("Football");
    return Scaffold(body:

        GridView.count(
            shrinkWrap: true,
            childAspectRatio: 4/2,
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,

            children: List.generate(6, (index) {
              return InterestWidgetItem(allName.elementAt(index),allIcon.elementAt(index),
              );
            }

        )),);
  }
  }