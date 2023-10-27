import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/view/success_payment_view_body.dart';
import '../../../../widgets/custom_app_bar.dart';

class SuccessPaymentView extends StatelessWidget {
  const SuccessPaymentView({super.key});
static String id= ' Success-payment-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: const SuccessPaymentViewBody(),
    );
  }
}
