import 'package:flutter/material.dart';

import '../core/utils/app_styles.dart';

class CustomPaymentItems extends StatelessWidget {
  const CustomPaymentItems({
    super.key, required this.title, required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: Styles.semiBold18,),
          Text(subtitle,style: Styles.semiBold18,),
        ],
      ),
    );
  }
}