import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_buissness_app/models/check_login.dart';
import 'package:my_buissness_app/models/checking.dart';
import 'package:my_buissness_app/users/model/users_model.dart';
import 'package:my_buissness_app/users/user_reposity/user_repositry.dart';



part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserReositry _userReositry;
  UserCubit(this._userReositry) : super(UserInitial());
  Future<void> addUserLocal(UserModel userModel) async {
    print('Cubitin Add Useri');

    try {
      print('tryin icindeyem');
      _userReositry.addUserLocal(userModel);

      final response = await _userReositry.selectedUserLocal(userModel);
      emit(SelecetUserState(response as UserModel));
    } catch (e) {}
  }

  Future<void> allUserLocal() async {
    try {
      final response = await _userReositry.allUserLocal();

      for (var yoxlama in response!) {
        if (yoxlama is Checking) {
          emit(LoginViewState());
        } else if (yoxlama is UserModel) {
          if (yoxlama.durum == 1) {
            emit(HomeViewState(yoxlama));
          }
        } else {
          emit(LoginViewState());
        }
      }
    } catch (e) {
      emit(Erroruser());
    }
  }

  Future<void> updateUserLocal(UserModel userModel) async {
    try {
      await _userReositry.updateUserLocal(userModel);
      final response = await _userReositry.selectedUserLocal(userModel);
      emit(SelecetUserState(response as UserModel));
      emit(HomeViewState(response));
    } catch (e) {}
  }

  Future<Yoxlama> selectUserLocal(UserModel userModel) async {
    final response = await _userReositry.selectedUserLocal(userModel);
    emit(SelecetUserState(response as UserModel));
    return response;
  }
}
