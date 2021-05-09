
import "package:awesome_dialog/awesome_dialog.dart" show AnimType, AwesomeDialog, DialogType;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_buissness_app/users/model/users_model.dart';
import 'package:my_buissness_app/users/user_cubit/user_cubit.dart';
import 'forgot_password_view.dart';
import 'login_view.dart';
import 'package:my_buissness_app/core/validator.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  late Color color;
  late int i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 10),
        child: Column(
          children: [
            rowElement(context),
            Expanded(
                flex: 1,
                child: Container(
                    height: MediaQuery.of(context).size.height * 48,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: buildColumnTextField(context))),
            SizedBox(
              height: 20,
            ),
            buildButtonSignUp(context),
          ],
        ),
      )),
    );
  }

  Widget buildColumnTextField(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 70,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 3) {
                            return "Ən az 3 hərf olmalıdır";
                          } else {
                            return null;
                          }
                        },
                        controller: controllerName,
                        decoration: InputDecoration(
                            labelText: "Ad", hintText: "Məs: Elnur"),
                      )),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 70,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 3) {
                            return "Ən az 3 hərf olmalıdır";
                          } else {
                            return null;
                          }
                        },
                        controller: controllerSurname,
                        decoration: InputDecoration(
                            labelText: "Soyad", hintText: "Məs: Muradov"),
                      )),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Icon(
                      Icons.mail,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 70,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (input) =>
                            input!.isValidEmail() ? null : 'email səhvdir',
                        controller: controllerMail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Mail",
                            hintText: "Məs: meselen@meselen.com"),
                      )),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Icon(
                      Icons.phone,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 70,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        validator: (input) => input!.isValidPhone()
                            ? null
                            : "nömrənizi düzgün yazın",
                        controller: controllerPhone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: "Nömrə", hintText: "Məs: +994123456789"),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Icon(
                      Icons.lock,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 70,
                      child: TextFormField(
                        obscureText: _isObscure,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (input) =>
                            input!.isValidPass() ? null : "şifrəni düzgün yazın",
                        controller: controllerPass,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            labelText: "Şifrə",
                            hintText: "Məs: Vignesh123!"),
                      )),
                ],
              ),
            ],
          )),
    );
  }

  ButtonTheme buildButtonSignUp(BuildContext context) {
    return ButtonTheme(
      shape: StadiumBorder(),
      minWidth: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Color(0xFFFF6969);
          },
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(""),
            Text(
              "Qeydiyyatdan keç",
              style: TextStyle(color: Colors.white),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFF6969),
                ),
              ),
            ),
          ],
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            var durum = 0;
            var uid = controllerName.text +
                controllerSurname.text +
                controllerMail.text +
                controllerPhone.text;

            context.read<UserCubit>().addUserLocal(UserModel.notId(
                name: controllerName.text,
                surname: controllerSurname.text,
                phone: controllerPhone.text,
                password: controllerPass.text,
                mail: controllerMail.text,
                uid: uid,
                durum: durum));

            AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Uğurlu qeydiyyat',
              desc: 'Biznesə başlayaq.............',
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
            )..show();
          }
        },
      ),
    );
  }

  Container rowElement(BuildContext context) {
    return Container(
      // color: Colors.green,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              "Sign Un",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
            },
            child: Text(
              "Log In",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPassword(),
                  ));
            },
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}
