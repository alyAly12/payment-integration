import 'package:dartz/dartz.dart';
import 'package:payment_project/core/utils/stripe_services.dart';
import 'package:payment_project/features/checkout/data/model/payment_intent_input_model.dart';
import '../../../../errors/failures.dart';



abstract class CheckOutRepo
{
Future<Either<Failure,void>>makePayment({required PaymentIntentInputModel paymentIntentInputModel, required StripeServices stripeServices});
}

