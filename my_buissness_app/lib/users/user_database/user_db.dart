


import 'package:my_buissness_app/database/database_helper.dart';
import 'package:my_buissness_app/models/check_login.dart';
import 'package:my_buissness_app/models/checking.dart';
import 'package:my_buissness_app/users/model/users_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

class UserDb {
  DatabaseHelper db = DatabaseHelper();

  Future<void> UserEkle(UserModel userModel) async {
    var db = await getDb(DatabaseHelper());
   await db.insert('users', userModel.toNotIdJson());

  }

  Future<Yoxlama?> UserModelSecGetir({UserModel? userModel}) async {
    try {
      var db = await getDb(DatabaseHelper());
      var cavab = await db.rawQuery(
          "SELECT * from users WHERE mail='${userModel!.mail}' AND password='${userModel.password}'");
      if (cavab.isEmpty) {
        return Checking();
      } else if (cavab.isNotEmpty) {
        for (Map map in cavab) {
          return UserModel.fromJson(map);
        }
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> _UserModelGetir() async {
    var db = await getDb(DatabaseHelper());
    var sonuc = await db.query('users');

    return sonuc;
  }

  Future<List<Yoxlama?>?> UserModelListesiniGetir() async {
    List<Yoxlama?>? ck;

    var result = await _UserModelGetir();

    if (result.isEmpty) {
      ck!.add(Checking());

      return ck;

      //
    } else if (result.isNotEmpty) {
      ck = List<Yoxlama>.from(result.map((model) => UserModel.fromJson(model)));

      return ck;
    }
  }

  Future<int> UserModelGuncelle(UserModel kategori) async {
    await Future.delayed(Duration(seconds: 3));

    var db = await getDb(DatabaseHelper());
    var sonuc = await db.update('users', kategori.toJson(),
        where: 'id = ?', whereArgs: [kategori.id]);
    await Future.delayed(Duration(seconds: 3));
    return sonuc;
  }

  Future<Database> getDb(DatabaseHelper db) {
    return db.getDatabase();
  }
}
