import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/view/cart_view_body.dart';
import '../../../../widgets/custom_app_bar.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});
static String id = 'CartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart', context: context),
      body: const CartViewBody(),
    );
  }


}
