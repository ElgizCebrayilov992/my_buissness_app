



import 'package:my_buissness_app/models/check_login.dart';

class UserModel extends Yoxlama {
  int? id;
  String? name;
  String? surname;
  String? mail;
  String? password;
  String? phone;
  int? durum;
  String? uid;

  UserModel(
      {required this.id,
      required this.name,
      required this.surname,
      required this.mail,
      required this.password,
      required this.phone,
      required this.durum,
      required this.uid
      
      });
  UserModel.login({
    required this.mail,
    required this.password,
  });
  UserModel.notId(
      {required this.name,
      required this.surname,
      required this.mail,
      required this.password,
      required this.phone,
      required this.durum,
      required this.uid});

  UserModel.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    mail = json['mail'];
    password = json['password'];
    phone = json['phone'];
    durum = json['durum'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
   final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['mail'] = mail;
    data['password'] = password;
    data['phone'] = phone;
    data['durum'] = durum;
    data['uid'] = uid;
    return data;
  }

  Map<String, dynamic> toLoginJson() {
   final data = <String, dynamic>{};
    data['mail'] = this.mail;
    data['password'] = this.password;
    return data;
  }

  Map<String, dynamic> toNotIdJson() {
    final data = <String, dynamic>{};
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['mail'] = this.mail;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['durum'] = this.durum;
    data['uid'] = this.uid;

    return data;
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, surname: $surname, mail: $mail, password: $password, phone: $phone, durum: $durum, uid: $uid}';
  }
}

// class UserModel1 extends CheckLogin {
//   String id;
//   String name;
//   String surname;
//   String phone;
//   String mail;
//   String uid;
//   String password;
//   String vip;
//   String paket;
//
//   UserModel1(
//       {this.name,
//       this.surname,
//       this.phone,
//       this.mail,
//       this.uid,
//       this.password,
//       this.vip,
//       this.paket});
//
//   UserModel1.wthId(
//       {this.id,
//       this.name,
//       this.surname,
//       this.phone,
//       this.mail,
//       this.uid,
//       this.password,
//       this.vip,
//       this.paket});
//   UserModel1.login({
//     this.mail,
//     this.password,
//   });
//
//   UserModel1.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     surname = json['surname'];
//     phone = json['phone'];
//     mail = json['mail'];
//     uid = json['uid'];
//     password = json['password'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['surname'] = this.surname;
//     data['phone'] = this.phone;
//     data['mail'] = this.mail;
//     data['uid'] = this.uid;
//     data['password'] = this.password;
//     data['vip'] = this.vip;
//     data['paket'] = this.paket;
//     data['durum'] = this.durum;
//
//     return data;
//   }
//
//   Map<String, dynamic> toNotIdJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['surname'] = this.surname;
//     data['phone'] = this.phone;
//     data['mail'] = this.mail;
//     data['uid'] = this.uid;
//     data['password'] = this.password;
//     data['vip'] = this.vip;
//     data['paket'] = this.paket;
//     return data;
//   }
//
//   Map<String, dynamic> toLoginJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['mail'] = this.mail;
//     data['password'] = this.password;
//     return data;
//   }
//
//   @override
//   String toString() {
//     return 'UserModel{id: $id, name: $name, surname: $surname, phone: $phone, mail: $mail, uid: $uid, password: $password, vip: $vip, paket: $paket}';
//   }
// }
