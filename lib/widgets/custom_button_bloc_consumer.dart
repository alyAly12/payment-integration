import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_project/core/utils/api_keys.dart';
import 'package:payment_project/features/checkout/data/model/amount_model/amount.dart';
import 'package:payment_project/features/checkout/data/model/amount_model/details.dart';
import 'package:payment_project/features/checkout/data/model/items_list_model/item.dart';
import 'package:payment_project/features/checkout/data/model/items_list_model/items_list_model.dart';
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
              // StripeServices stripeServices = StripeServices();
              // PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
              //     amount: '100',
              //     currency: 'usd',
              //   customerId: ApiKeys.customerId
              // );
              // BlocProvider.of<StripePaymentCubit>(context).makePayment(
              //     paymentIntentInputModel: paymentIntentInputModel,
              //     stripeServices: stripeServices
              // );
              var transactionData = getTransactionData();
              executePayPalPayment(context, transactionData);
            });
      },
    );
  }

  void executePayPalPayment(BuildContext context, ({AmountModel amount, ItemsListModel itemList}) transactionData) {
     Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.payPalSecretKey,
        transactions: [
          {
            "amount":transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list":transactionData.itemList.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    )
    );
  }
  ({AmountModel amount, ItemsListModel itemList}) getTransactionData(){
     var amount = AmountModel(
       currency:'USD' ,
       total:'100' ,
       details:DetailsModel(
           subtotal:'100' ,
           shipping:'0' ,
           shippingDiscount: 0),
     );
     List<OrderItemModel>orders=[
       OrderItemModel(
           currency: 'USD',
           name:'Apple' ,
           quantity:10,
           price:'4'
       ),
       OrderItemModel(
           currency: 'USD',
           name:'Banana' ,
           quantity:12,
           price:'5'
       ),
     ];
     var itemListModel = ItemsListModel(items: orders);
     return(amount: amount ,itemList:itemListModel );
   }
}
