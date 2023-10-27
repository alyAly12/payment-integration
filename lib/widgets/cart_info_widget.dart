import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/utils/app_styles.dart';


class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 22),
      width: 305,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:16 ,bottom: 16,left:23 ,right: 23),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            const SizedBox(width: 23,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Credit Card ',
                    style: Styles.semiBold18,
                  ),
                  TextSpan(
                      text: 'Mastercard **78 ',
                      style:Styles.lightGrey18
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

