
import 'package:y2y/features/Communities/model/get_all_communities_voulnteer_model.dart';

class CommunitiesModel {
  bool? success;
  List<CommunitiesModellvoulnteer>? data;

  CommunitiesModel({
    this.success,
    this.data,
  });

  factory CommunitiesModel.fromJson(Map<String, dynamic> json) =>
      CommunitiesModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<CommunitiesModellvoulnteer>.from(
                json["data"]!.map((x) => CommunitiesModellvoulnteer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

