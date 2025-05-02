import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';

class OpportnmityStateModel {
  bool? success;
  List<GetAllOpportunities>? data;

  OpportnmityStateModel({
    this.success,
    this.data,
  });

  factory OpportnmityStateModel.fromJson(Map<String, dynamic> json) =>
      OpportnmityStateModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<GetAllOpportunities>.from(
                json["data"]!.map((x) => GetAllOpportunities.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
