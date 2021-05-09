import 'package:flutter/material.dart';

import 'forgot_password_view.dart';
import 'sign_up_view.dart';
import 'package:my_buissness_app/core/validator.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  int rowIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 10),
        child: Column(
          children: [
            rowElement(context),
            Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
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
                                    validator: (input) => input!.isValidEmail()
                                        ? null
                                        : "email səhvdir",
                                    controller: controllerMail,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        labelText: "Mail",
                                        hintText: "Məs: meselen@meselen.com"),
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
                                    validator: (input) => input!.isValidPass()
                                        ? null
                                        : "şifrəni düzgün yazın",
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
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonTheme(
              shape: StadiumBorder(),
              minWidth: double.infinity,
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(""),
                    Text(
                      "LOG IN",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFFF6969),
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: () async {

                },
                color: Color(0xFFFF6969),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Don’t have an account? Swipe right to"),
            InkWell(
                onTap: () {},
                child: Text(
                  " create a new account.",
                  style: TextStyle(color: Color(0xFFFF6969)),
                ))
          ],
        ),
      )),
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
              "Log In",
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
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ));
            },
            child: Text(
              "Sign Un",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
