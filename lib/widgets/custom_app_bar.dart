

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/utils/app_styles.dart';

AppBar buildAppBar({ String? title,required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Center(child: GestureDetector(
        onTap: (){
          Navigator.canPop(context)?Navigator.pop(context):null;
        },
        child: SvgPicture.asset('assets/images/arrow.svg'))),
    title: Text(title??'',
      style: Styles.style25,
    ),
    centerTitle: true,
  );
}