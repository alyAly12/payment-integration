import 'package:flutter/material.dart';
import '../../../../widgets/custom_check_icon.dart';
import '../../../../widgets/dashed_line_widget.dart';
import '../../../../widgets/success_card.dart';


class SuccessPaymentViewBody extends StatelessWidget {
  const SuccessPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20 ,right: 20,bottom: 60),
      child: Stack(
        clipBehavior: Clip.none,
        children:[
          const SuccessCard(),
          Positioned(
            left: 23,
            right: 23,
            bottom: MediaQuery.of(context).size.height*.2+20,
            child: const DashedLineWidget(),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height*.2,
            left: -20,
            child:  CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height*.2,
            right: -20,
            child:  CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
         const Positioned(
           top: -40,
           left: 0,
           right: 0,
           child: CustomCheckIcon(),
         ),

      ]),
    );
  }
}




