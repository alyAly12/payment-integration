import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/view/cart_view.dart';
import 'package:payment_project/features/checkout/presentation/view/payment_detail_view.dart';
import 'package:payment_project/features/checkout/presentation/view/success_payment_view.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CartView(),
      routes:{
        CartView.id:(context)=>const CartView(),
        PaymentDetailView.id:(context)=>const PaymentDetailView(),
        SuccessPaymentView.id:(context)=>const SuccessPaymentView()
      },
    );
  }
}
