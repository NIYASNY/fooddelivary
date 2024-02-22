import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
    User? user;
    String? message;

    Usermodel({
        this.user,
        this.message,
    });

    factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        user: User.fromJson(json["user"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "message": message,
    };
}

class User {
    String? allow;
    String? name;
    String? mobile;
    String? email;
    String? password;
    String? id;
    List<dynamic>? address;
    List<dynamic>? cartItems;
    List<dynamic>? orders;
    int? v;

    User({
        this.allow,
        this.name,
        this.mobile,
        this.email,
        this.password,
        this.id,
        this.address,
        this.cartItems,
        this.orders,
        this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        allow: json["allow"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        password: json["password"],
        id: json["_id"],
        address: List<dynamic>.from(json["address"].map((x) => x)),
        cartItems: List<dynamic>.from(json["cartItems"].map((x) => x)),
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "allow": allow,
        "name": name,
        "mobile": mobile,
        "email": email,
        "password": password,
        "_id": id,
        "address": List<dynamic>.from(address!.map((x) => x)),
        "cartItems": List<dynamic>.from(cartItems!.map((x) => x)),
        "orders": List<dynamic>.from(orders!.map((x) => x)),
        "__v": v,
    };
}
