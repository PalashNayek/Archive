
import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../utilities/app_common_helper.dart';
import '../utils.dart';

class CategorySelectItem extends StatelessWidget{
  final VoidCallback onclick;
  final String title;
  final String icon;

  final bool isSelected;

  CategorySelectItem({
    required this.isSelected,
    required this.onclick,
    required this.title,
    required this.icon,
  });
  @override

  Widget build(BuildContext context){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return GestureDetector(
        onTap: onclick,
        child: Container(
          decoration: BoxDecoration (
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? secondary : null,
          ),
         margin: EdgeInsets.fromLTRB(20*fem, 5*fem, 20*fem, 5*fem),
         width: 80*fem,
         height: 80,
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Container(
             margin: EdgeInsets.only(top: 5),
             height: 40,
             width: 40,
             decoration: BoxDecoration (
               borderRadius: BorderRadius.circular(30*fem),
               image: DecorationImage (
                 fit: BoxFit.cover,
                 image: NetworkImage (icon
                 ),
               ),
             ),
           ),
          Center(
            child: Container(
              width: double.infinity,
              child: Text(title,
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Lato',
                  fontSize: AppCommonHelper.isTablet(context)?14: 14*ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2*ffem/fem,
                  color: isSelected ? Colors.white :Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}