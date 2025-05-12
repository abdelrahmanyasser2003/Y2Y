

class User {
    bool? success;
    UserModel? data;

    User({
        this.success,
        this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class UserModel {
    String? id;
    String? firstName;
    String? lastName;
    String? email;
    Address? address;
    String? phone;
    String? gender;
    String? roles;
    String? status;
    String? confirmEmail;
    List<String>? interested;
    List<Community>? communities;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? profileImage;
    String? userName;
    List<String>? skills;
    String? vulonteerReqStatus;
    String? education;
    IdImages? idImages;
    DateTime? bd;
    String? bio;
    DateTime? expireDateOtp;
    int? otp;

    UserModel({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.address,
        this.phone,
        this.gender,
        this.roles,
        this.status,
        this.confirmEmail,
        this.interested,
        this.communities,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.profileImage,
        this.userName,
        this.skills,
        this.vulonteerReqStatus,
        this.education,
        this.idImages,
        this.bd,
        this.bio,
        this.expireDateOtp,
        this.otp,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"],
        gender: json["gender"],
        roles: json["roles"],
        status: json["status"],
        confirmEmail: json["confirmEmail"],
        interested: json["interested"] == null ? [] : List<String>.from(json["interested"]!.map((x) => x)),
        communities: json["communities"] == null ? [] : List<Community>.from(json["communities"]!.map((x) => Community.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        profileImage: json["profileImage"],
        userName: json["userName"],
        skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
        vulonteerReqStatus: json["vulonteerReqStatus"],
        education: json["education"],
        idImages: json["IDImages"] == null ? null : IdImages.fromJson(json["IDImages"]),
        bd: json["BD"] == null ? null : DateTime.parse(json["BD"]),
        bio: json["bio"],
        expireDateOtp: json["expireDateOTP"] == null ? null : DateTime.parse(json["expireDateOTP"]),
        otp: json["OTP"],
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
        "status": status,
        "confirmEmail": confirmEmail,
        "interested": interested == null ? [] : List<dynamic>.from(interested!.map((x) => x)),
        "communities": communities == null ? [] : List<dynamic>.from(communities!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "profileImage": profileImage,
        "userName": userName,
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "vulonteerReqStatus": vulonteerReqStatus,
        "education": education,
        "IDImages": idImages?.toJson(),
        "BD": bd?.toIso8601String(),
        "bio": bio,
        "expireDateOTP": expireDateOtp?.toIso8601String(),
        "OTP": otp,
    };
}

class Address {
    String? state;
    String? city;
    String? street;

    Address({
        this.state,
        this.city,
        this.street,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
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

class Community {
    String? community;
    String? status;

    Community({
        this.community,
        this.status,
    });

    factory Community.fromJson(Map<String, dynamic> json) => Community(
        community: json["community"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "community": community,
        "status": status,
    };
}

class IdImages {
    String? frontIdCardImage;
    String? backIdCardImage;

    IdImages({
        this.frontIdCardImage,
        this.backIdCardImage,
    });

    factory IdImages.fromJson(Map<String, dynamic> json) => IdImages(
        frontIdCardImage: json["frontIdCardImage"],
        backIdCardImage: json["backIdCardImage"],
    );

    Map<String, dynamic> toJson() => {
        "frontIdCardImage": frontIdCardImage,
        "backIdCardImage": backIdCardImage,
    };
}
