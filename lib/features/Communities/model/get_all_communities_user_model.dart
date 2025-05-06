// To parse this JSON data, do
//
//     final communitiesModel = communitiesModelFromJson(jsonString);


class GetAllCommunitiesUserModel {
    String? id;
    String? name;
    String? slug;
    List<String>? types;
    String? desc;
    String? image;
    Category? category;
    Category? subcategory;
    List<Volunteer>? members;
    int? limitOfUsers;
    String? roles;
    Location? location;
    Volunteer? volunteer;
    String? status;
    Date? date;
    String? createdBy;
    String? updatedBy;
    List<String>? askToJoin;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    int? numberOfMembers;
    String? datumId;

    GetAllCommunitiesUserModel({
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
        this.volunteer,
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

    factory GetAllCommunitiesUserModel.fromJson(Map<String, dynamic> json) => GetAllCommunitiesUserModel(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
        desc: json["desc"],
        image: json["image"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        subcategory: json["subcategory"] == null ? null : Category.fromJson(json["subcategory"]),
        members: json["members"] == null ? [] : List<Volunteer>.from(json["members"]!.map((x) => Volunteer.fromJson(x))),
        limitOfUsers: json["limitOfUsers"],
        roles: json["roles"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        volunteer: json["volunteer"] == null ? null : Volunteer.fromJson(json["volunteer"]),
        status: json["status"],
        date: json["date"] == null ? null : Date.fromJson(json["date"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        askToJoin: json["askTOJoin"] == null ? [] : List<String>.from(json["askTOJoin"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
        "members": members == null ? [] : List<dynamic>.from(members!.map((x) => x.toJson())),
        "limitOfUsers": limitOfUsers,
        "roles": roles,
        "location": location?.toJson(),
        "volunteer": volunteer?.toJson(),
        "status": status,
        "date": date?.toJson(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "askTOJoin": askToJoin == null ? [] : List<dynamic>.from(askToJoin!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "numberOfMembers": numberOfMembers,
        "id": datumId,
    };
}

class Category {
    String? id;
    String? name;
    String? slug;
    String? image;

    Category({
        this.id,
        this.name,
        this.slug,
        this.image,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
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
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        schedule: json["schedule"] == null ? [] : List<String>.from(json["schedule"]!.map((x) => x)),
        startAt: json["startAt"] == null ? null : DateTime.parse(json["startAt"]),
        finishAt: json["finishAt"] == null ? null : DateTime.parse(json["finishAt"]),
    );

    Map<String, dynamic> toJson() => {
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "schedule": schedule == null ? [] : List<dynamic>.from(schedule!.map((x) => x)),
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

class Volunteer {
    String? id;
    String? firstName;
    String? lastName;
    String? email;
    Location? address;
    String? phone;
    String? gender;
    String? roles;
    List<String>? interested;
    String? profileImage;
    String? userName;
    List<String>? skills;
    String? education;
    DateTime? bd;
    String? bio;

    Volunteer({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.address,
        this.phone,
        this.gender,
        this.roles,
        this.interested,
        this.profileImage,
        this.userName,
        this.skills,
        this.education,
        this.bd,
        this.bio,
    });

    factory Volunteer.fromJson(Map<String, dynamic> json) => Volunteer(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        address: json["address"] == null ? null : Location.fromJson(json["address"]),
        phone: json["phone"],
        gender: json["gender"],
        roles: json["roles"],
        interested: json["interested"] == null ? [] : List<String>.from(json["interested"]!.map((x) => x)),
        profileImage: json["profileImage"],
        userName: json["userName"],
        skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
        education: json["education"],
        bd: json["BD"] == null ? null : DateTime.parse(json["BD"]),
        bio: json["bio"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address": address?.toJson(),
        "phone": phone,
        "gender": gender,
        "roles": roles,
        "interested": interested == null ? [] : List<dynamic>.from(interested!.map((x) => x)),
        "profileImage": profileImage,
        "userName": userName,
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "education": education,
        "BD": bd?.toIso8601String(),
        "bio": bio,
    };
}
