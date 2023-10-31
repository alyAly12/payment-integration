import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_project/core/utils/api_keys.dart';
import 'package:payment_project/core/utils/stripe_services.dart';
import 'package:payment_project/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment_project/features/checkout/presentation/stripe_payment_cubit.dart';
import 'package:payment_project/features/checkout/presentation/view/success_payment_view.dart';
import 'package:payment_project/widgets/payment_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if(state is StripePaymentSuccess){
          Navigator.pushReplacementNamed(context, SuccessPaymentView.id);
        }
        if(state is StripePaymentFailure){
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return PaymentButton(
            isLoading: state is StripePaymentLoading?true:false,
            title: 'Pay',
            onPressed: () {
              StripeServices stripeServices = StripeServices();
              PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
                  amount: '100',
                  currency: 'usd',
                customerId: ApiKeys.customerId
              );
              BlocProvider.of<StripePaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel,
                  stripeServices: stripeServices
              );
            });
      },
    );
  }
}
