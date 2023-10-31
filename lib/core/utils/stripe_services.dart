import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_project/core/utils/api_keys.dart';
import 'package:payment_project/core/utils/api_services.dart';
import 'package:payment_project/features/checkout/data/model/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_project/features/checkout/data/model/initi_payment_sheet_input_model.dart';
import 'package:payment_project/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment_project/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';

class StripeServices
{
  ApiServices apiServices = ApiServices();
Future<PaymentIntentModel> createPaymentIntent (
    PaymentIntentInputModel paymentIntentInputModel
    )async{
 var response = await apiServices.post(url:'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson()
  );
 var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
 return paymentIntentModel;
}

Future initPaymentSheet({required InitPaymentSheetInputModel initPaymentSheetInputModel})async{
 await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        merchantDisplayName: 'mohamed',
        customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: ApiKeys.customerId
      ));
}

Future displayPaymentSheet()async{
 await Stripe.instance.presentPaymentSheet();
}
Future makePayment({required PaymentIntentInputModel paymentIntentInputModel})async{
  var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
  var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
  var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      customerId: paymentIntentInputModel.customerId,
      clientSecret: paymentIntentModel.clientSecret,
      ephemeralKeySecret: ephemeralKeyModel.secret!
  );
  await initPaymentSheet(initPaymentSheetInputModel: initPaymentSheetInputModel);
  await displayPaymentSheet();
}
  Future<EphemeralKeyModel> createEphemeralKey (
  {required String customerId}
      )async{
    var response = await apiServices.post(url:'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization':'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version':'2023-10-16'
        },
        body: {
      'customer':customerId
        }
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

}