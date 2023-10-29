import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_project/core/utils/stripe_services.dart';
import 'package:payment_project/features/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment_project/features/checkout/data/repo/checkout_repo.dart';
part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkOutRepo) : super(StripePaymentInitial());
  final CheckOutRepo checkOutRepo;

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel,required StripeServices stripeServices})async{
    emit(StripePaymentLoading());
    var data = await checkOutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
        stripeServices: stripeServices);
    data.fold(
            (l) => emit(StripePaymentFailure(l.errorMessage)),
            (r) => emit(StripePaymentSuccess()));
  }
  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
