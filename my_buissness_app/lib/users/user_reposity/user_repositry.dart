

import 'package:my_buissness_app/models/check_login.dart';
import 'package:my_buissness_app/users/model/users_model.dart';
import 'package:my_buissness_app/users/user_database/user_db.dart';

abstract class UserReositry {


  //local
  Future<List<Yoxlama?>?> allUserLocal();

  Future<void> addUserLocal(UserModel userModel);

  Future<int> updateUserLocal(UserModel userModel);

  Future<Yoxlama?> selectedUserLocal(UserModel userModel);
}

class UserUse implements UserReositry {
  UserDb db = UserDb();
  




  @override

  Future<void> addUserLocal(UserModel userModel) async => await db.UserEkle(userModel);

  @override
  Future<List<Yoxlama?>?> allUserLocal() async {
   
    return await db.UserModelListesiniGetir();
  }

  @override
  Future<Yoxlama?> selectedUserLocal(UserModel userModel) async {
    return await db.UserModelSecGetir(userModel: userModel);
  }

  @override
  Future<int> updateUserLocal(UserModel userModel) async => await db.UserModelGuncelle(userModel);
}
