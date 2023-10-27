import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_project/core/utils/app_styles.dart';
import 'cart_info_widget.dart';
import 'custom_payment_items.dart';

class SuccessCard extends StatelessWidget {
  const SuccessCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40+16,left: 22,right: 22),
        child: Column(
          children: [
            Text('Thank you!',style: Styles.style25,),
            const SizedBox(height: 2,),
            Text('Your transaction was successful',style: Styles.style20,),
            const SizedBox(height: 18,),
            const CustomPaymentItems(title: 'Date', subtitle: '01/24/2023',),
            const CustomPaymentItems(title: 'Time', subtitle: '10:15 AM'),
            const CustomPaymentItems(title: 'To', subtitle: 'Sam Louis'),
            const Divider(thickness: 2,height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', textAlign: TextAlign.center, style: Styles.style24),
                Text('\$50.97',
                    textAlign: TextAlign.center, style: Styles.style24),
              ],
            ),
            const SizedBox(height: 25,),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/images/qr.svg'),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(child: Text('PAID',style: Styles.style24.copyWith(color: const Color(0xFF34A853)),)),
                )
              ],
            ),
            SizedBox(height:((MediaQuery.of(context).size.height*.2+20)/2)-29,)
          ],
        ),
      ),
    );
  }
}

