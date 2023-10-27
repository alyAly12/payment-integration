import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/view/payment_detail_body.dart';
import 'package:payment_project/widgets/custom_app_bar.dart';

class PaymentDetailView extends StatelessWidget {
  const PaymentDetailView({super.key});
static String id = 'details-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details', context: context),
      body: const PaymentDetailBody(),
    );
  }
}
