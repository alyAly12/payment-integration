import 'package:flutter/material.dart';
import 'package:payment_project/widgets/payment_method_item.dart';
import '../core/consts.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  int activeIndex= 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: Consts.paymentMethods.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: GestureDetector(
                onTap: (){
                  activeIndex = index;
                  setState(() {});
                },
                child: PaymentMethodItem(
                    isActive: activeIndex == index,
                    image: Consts.paymentMethods[index].image),
              ),
            );
          }),
    );
  }
}