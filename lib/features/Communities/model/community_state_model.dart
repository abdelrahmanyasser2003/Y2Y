
import 'package:y2y/features/Communities/model/get_all_communities_model.dart';

class CommunitiesModel {
  bool? success;
  List<CommunitiesModell>? data;

  CommunitiesModel({
    this.success,
    this.data,
  });

  factory CommunitiesModel.fromJson(Map<String, dynamic> json) =>
      CommunitiesModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<CommunitiesModell>.from(
                json["data"]!.map((x) => CommunitiesModell.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

