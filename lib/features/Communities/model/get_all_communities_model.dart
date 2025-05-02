class CommunitiesModell {
  String? id;
  String? name;
  String? slug;
  List<String>? types;
  String? desc;
  String? image;
  Category? category;
  Category? subcategory;
  List<dynamic>? members;
  int? limitOfUsers;
  String? roles;
  Location? location;
  Volunteer? volunteer;  // تعديل هنا
  String? status;
  Date? date;
  String? createdBy;
  String? updatedBy;
  List<dynamic>? askToJoin;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? numberOfMembers;
  String? datumId;

  CommunitiesModell({
    this.id,
    this.name,
    this.slug,
    this.types,
    this.desc,
    this.image,
    this.category,
    this.subcategory,
    this.members,
    this.limitOfUsers,
    this.roles,
    this.location,
    this.volunteer,  // تعديل هنا
    this.status,
    this.date,
    this.createdBy,
    this.updatedBy,
    this.askToJoin,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.numberOfMembers,
    this.datumId,
  });

  factory CommunitiesModell.fromJson(Map<String, dynamic> json) =>
      CommunitiesModell(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        types: json["types"] == null
            ? []
            : List<String>.from(json["types"]!.map((x) => x)),
        desc: json["desc"],
        image: json["image"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : Category.fromJson(json["subcategory"]),
        members: json["members"] == null
            ? []
            : List<dynamic>.from(json["members"]!.map((x) => x)),
        limitOfUsers: json["limitOfUsers"],
        roles: json["roles"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        volunteer: json["volunteer"] == null
            ? null
            : Volunteer.fromJson(json["volunteer"]),  // تعديل هنا
        status: json["status"],
        date: json["date"] == null ? null : Date.fromJson(json["date"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        askToJoin: json["askTOJoin"] == null
            ? []
            : List<dynamic>.from(json["askTOJoin"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        numberOfMembers: json["numberOfMembers"],
        datumId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "desc": desc,
        "image": image,
        "category": category?.toJson(),
        "subcategory": subcategory?.toJson(),
        "members":
            members == null ? [] : List<dynamic>.from(members!.map((x) => x)),
        "limitOfUsers": limitOfUsers,
        "roles": roles,
        "location": location?.toJson(),
        "volunteer": volunteer?.toJson(),  // تعديل هنا
        "status": status,
        "date": date?.toJson(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "askTOJoin": askToJoin == null
            ? []
            : List<dynamic>.from(askToJoin!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "numberOfMembers": numberOfMembers,
        "id": datumId,
      };
}

class Volunteer {
  String? firstName;
  String? lastName;
  String? profileImage;
  String? userName;

  Volunteer({
    this.firstName,
    this.lastName,
    this.profileImage,
    this.userName,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) => Volunteer(
        firstName: json["firstName"],
        lastName: json["lastName"],
        profileImage: json["profileImage"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "profileImage": profileImage,
        "userName": userName,
      };
}

class Category {
  String? name;
  String? slug;
  String? image;

  Category({
    this.name,
    this.slug,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "image": image,
      };
}

class Date {
  DateTime? startDate;
  DateTime? endDate;
  List<String>? schedule;
  DateTime? startAt;
  DateTime? finishAt;

  Date({
    this.startDate,
    this.endDate,
    this.schedule,
    this.startAt,
    this.finishAt,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        schedule: json["schedule"] == null
            ? []
            : List<String>.from(json["schedule"]!.map((x) => x)),
        startAt:
            json["startAt"] == null ? null : DateTime.parse(json["startAt"]),
        finishAt:
            json["finishAt"] == null ? null : DateTime.parse(json["finishAt"]),
      );

  Map<String, dynamic> toJson() => {
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "schedule":
            schedule == null ? [] : List<dynamic>.from(schedule!.map((x) => x)),
        "startAt": startAt?.toIso8601String(),
        "finishAt": finishAt?.toIso8601String(),
      };
}

class Location {
  String? state;
  String? city;
  String? street;

  Location({
    this.state,
    this.city,
    this.street,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        state: json["state"],
        city: json["city"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "street": street,
      };
}
