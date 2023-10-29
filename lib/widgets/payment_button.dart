import 'package:flutter/material.dart';
import 'package:payment_project/core/utils/app_styles.dart';


class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key, required this.title,required this.onPressed,  this.isLoading = false,});
final String title;
 final void Function()? onPressed;
 final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15)
        ),
        height: 60,
        width:280 ,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF34A853),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
            onPressed:onPressed,
            child: isLoading
                ?const CircularProgressIndicator()
                :Text(
                title,
                style:Styles.style22
            ),
        ),
      ),
    );
  }
}
