import 'package:flutter/material.dart';
import 'package:payment_project/core/utils/app_styles.dart';
import 'package:payment_project/features/checkout/presentation/view/payment_detail_view.dart';
import 'package:payment_project/widgets/order_info_item.dart';
import 'package:payment_project/widgets/payment_button.dart';
import 'package:payment_project/widgets/payment_methods_bottom_sheet.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Expanded(child: Image.asset('assets/images/bag.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            subTitle: '\$42.97',
          ),
          const OrderInfoItem(
            title: 'Discount',
            subTitle: '\$0',
          ),
          const OrderInfoItem(
            title: 'Shipping',
            subTitle: '\$8',
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 2,
            color: Color(0xFFC6C6C6),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', textAlign: TextAlign.center, style: Styles.style24),
              Text('\$50.97',
                  textAlign: TextAlign.center, style: Styles.style24),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          PaymentButton(title: 'Complete Payment', onPressed: () {
            // Navigator.pushNamed(context, PaymentDetailView.id);
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight:Radius.circular(12) ,topLeft: Radius.circular(12))
              ),
                context: context,
                builder: (context){
                  return const PaymentMethodsBottomSheet();
                });
          },)
        ],
      ),
    );
  }
}
