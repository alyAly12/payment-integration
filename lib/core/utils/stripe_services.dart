import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_project/core/utils/api_keys.dart';
import 'package:payment_project/core/utils/api_services.dart';
import 'package:payment_project/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment_project/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';

class StripeServices
{
  ApiServices apiServices = ApiServices();
Future<PaymentIntentModel> createPaymentIntent (
    PaymentIntentInputModel paymentIntentInputModel
    )async{
 var response = await apiServices.post(url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
      body: paymentIntentInputModel.toJson()
  );
 var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
 return paymentIntentModel;
}

Future initPaymentSheet({required String paymentIntentClientSecret })async{
  Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'mohamed'
      ));
}

Future displayPaymentSheet()async{
  Stripe.instance.presentPaymentSheet();
}
Future makePayment({required PaymentIntentInputModel paymentIntentInputModel})async{
  var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
  await initPaymentSheet(paymentIntentClientSecret: paymentIntentModel.clientSecret);
  await displayPaymentSheet();
}
}