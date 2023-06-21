import 'package:flutter/material.dart';

import '../utilities/app_common_helper.dart';
import '../utils.dart';

class BannerItem extends StatelessWidget {
  BannerItem(this.item);

  String item;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(item),
          filterQuality: FilterQuality.low,
          fit: AppCommonHelper.isTablet(context) ? BoxFit.cover : BoxFit.fill,
        ),
      ),
    );
  }
}
