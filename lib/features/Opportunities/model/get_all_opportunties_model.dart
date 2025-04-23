class GetAllOpportunties {
  String? id;
  String? title;
  String? description;
  DateTime? deadline;
  String? image;
  CreatedBy? createdBy;
  String? updatedBy;
  List<React>? react;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? slug;

  GetAllOpportunties({
    this.id,
    this.title,
    this.description,
    this.deadline,
    this.image,
    this.createdBy,
    this.updatedBy,
    this.react,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.slug,
  });

  factory GetAllOpportunties.fromJson(Map<String, dynamic> json) =>
      GetAllOpportunties(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        deadline:
            json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        image: json["image"],
        createdBy: json["createdBy"] == null
            ? null
            : CreatedBy.fromJson(json["createdBy"]),
        updatedBy: json["updatedBy"],
        react: json["react"] == null
            ? []
            : List<React>.from(json["react"]!.map((x) => React.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "deadline": deadline?.toIso8601String(),
        "image": image,
        "createdBy": createdBy?.toJson(),
        "updatedBy": updatedBy,
        "react": react == null
            ? []
            : List<dynamic>.from(react!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "slug": slug,
      };
}

class CreatedBy {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profileImage;
  String? userName;

  CreatedBy({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImage,
    this.userName,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        profileImage: json["profileImage"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "profileImage": profileImage,
        "userName": userName,
      };
}

class React {
  String? user;
  String? react;

  React({
    this.user,
    this.react,
  });

  factory React.fromJson(Map<String, dynamic> json) => React(
        user: json["user"],
        react: json["react"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "react": react,
      };
}
