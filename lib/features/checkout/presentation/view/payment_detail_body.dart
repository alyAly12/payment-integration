import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/view/success_payment_view.dart';
import 'package:payment_project/widgets/custom_credit_card.dart';
import '../../../../widgets/payment_button.dart';
import '../../../../widgets/payment_methods_listview.dart';



class PaymentDetailBody extends StatefulWidget {
  const PaymentDetailBody({super.key});

  @override
  State<PaymentDetailBody> createState() => _PaymentDetailBodyState();
}

class _PaymentDetailBodyState extends State<PaymentDetailBody> {
  final GlobalKey<FormState>formKey= GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
       const SliverToBoxAdapter(
         child:  PaymentMethodListView(),
       ),
         SliverToBoxAdapter(
          child: CustomCreditCard(formKey: formKey, autoValidateMode:autoValidateMode,),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: PaymentButton(title: 'Pay', onPressed: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                }else{
                  Navigator.pushReplacementNamed(context, SuccessPaymentView.id);
                  autoValidateMode =AutovalidateMode.always;
                  setState(() {});
                }
              })),
        )
      ],
    );
  }
}



