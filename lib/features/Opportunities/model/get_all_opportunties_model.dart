class GetAllOpportunities {
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
  String? company;
  String? responsibilities;
  String? requirements;
  String? duration;
  String? link;

  GetAllOpportunities({
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
    this.company,
    this.responsibilities,
    this.requirements,
    this.duration,
    this.link,
  });

  factory GetAllOpportunities.fromJson(Map<String, dynamic> json) =>
      GetAllOpportunities(
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
        react: (json["react"] as List<dynamic>?)
            ?.map((x) => React.fromJson(x))
            .toList(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        slug: json["slug"],
        company: json["company"],
        responsibilities: json["responsibilities"],
        requirements: json["requirements"],
        duration: json["duration"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "deadline": deadline?.toIso8601String(),
        "image": image,
        "createdBy": createdBy?.toJson(),
        "updatedBy": updatedBy,
        "react": react?.map((x) => x.toJson()).toList(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "slug": slug,
        "company": company,
        "responsibilities": responsibilities,
        "requirements": requirements,
        "duration": duration,
        "link": link,
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
