import 'package:flutter/material.dart';
import 'package:payment_project/core/utils/app_styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.subTitle});
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         title,
          textAlign: TextAlign.center,
          style: Styles.semiBold18
        ),
        Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Styles.semiBold18
        ),
      ],
    );
  }
}
