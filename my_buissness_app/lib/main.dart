import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'users/user_cubit/user_cubit.dart';
import 'users/user_reposity/user_repositry.dart';
import 'widgets/pages/home_view.dart';
import 'widgets/pages/login_view.dart';

/*class MyHttpOverrrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
*/
void main() {
  //HttpOverrides.global = MyHttpOverrrides();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserCubit uCubit = UserCubit(UserUse());

  Scaffold buildError() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget homePage(Widget scaffold) {
    return MaterialApp(
      title: 'My Mini Buissness',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: scaffold,
    );
  }

  @override
  Widget build(BuildContext context) {
    uCubit.allUserLocal();


    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => uCubit,
        ),

      ],
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return homePage(Scaffold(
              body: Center(
                child: Text('UserInitial'),
              ),
            ));
          } else if (state is LoginViewState) {
            return homePage(Login());
          } else if (state is HomeViewState) {
            return homePage(HomeView());
          } else {
            return homePage(Login());
          }
        },
      ),
    );
  }
}
