
import 'package:dartz/dartz.dart';
import 'package:payment_project/core/utils/stripe_services.dart';
import 'package:payment_project/errors/failures.dart';
import 'package:payment_project/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment_project/features/checkout/data/repo/checkout_repo.dart';

class CheckOutRepoImpl extends CheckOutRepo
{
  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel, required StripeServices stripeServices})async {
    try{
     await stripeServices.makePayment(paymentIntentInputModel: paymentIntentInputModel);
     return right(null);
    }catch(e){
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}