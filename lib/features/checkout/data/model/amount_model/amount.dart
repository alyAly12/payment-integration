import 'details.dart';

class AmountModel {
  String? total;
  String? currency;
  DetailsModel? details;

  AmountModel({this.total, this.currency, this.details});

  factory AmountModel.fromJson(Map<String, dynamic> json) => AmountModel(
        total: json['total'] as String?,
        currency: json['currency'] as String?,
        details: json['details'] == null
            ? null
            : DetailsModel.fromJson(json['details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}
