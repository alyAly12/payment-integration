import 'package:flutter/material.dart';
import 'package:payment_project/widgets/payment_button.dart';
import 'package:payment_project/widgets/payment_methods_listview.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethodListView(),
          PaymentButton(title: 'Pay', onPressed: (){})
        ],
      ),
    );
  }
}
