import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: const Color(0xffEDEDED),
      child: CircleAvatar(
        radius: 34,
        backgroundColor: const Color(0xff34A853),
        child: SvgPicture.asset('assets/images/check-mark.svg',height: 40,),
      ),
    );
  }
}
