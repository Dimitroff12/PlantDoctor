import 'package:apptest/services/opt2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:apptest/services/auth.dart';
//import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class signup extends StatefulWidget {
  
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  //final _otp = FlutterOtp();
  final _otp2 = Otp2();
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmpassword = '';
  String error = '';
  bool _isObscure = true;
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[300],
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.03,
                      bottom: MediaQuery.of(context).size.width * 0.05),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 1.25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Salsa'),
                          children: [
                        TextSpan(
                            text: "signup here".tr,
                            style: TextStyle(color: Colors.white)),
                      ])),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.02,
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: Text(
                        "in just 1 step".tr,
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.25,
                            fontSize: 14.0),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.only(bottom: 30.0, top: 20.0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0, top: 30.0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter Name'.tr : null,
                            onChanged: (val) {
                              setState(() => name = val);
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.teal),
                              ),
                              labelText: 'Enter Name'.tr,
                              labelStyle: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter Email Id'.tr : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.teal),
                              ),
                              labelText: 'Enter Email Id'.tr,
                              labelStyle: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter Phone no'.tr : null,
                            onChanged: (val) {
                              setState(() => phone = val);
                            },
                            decoration: InputDecoration(
                              suffixIcon: TextButton(
                                  onPressed: () {
                                    _otp2.verifyPhone(phone);
                                  },
                                  child: Text("Send OTP".tr)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.teal),
                              ),
                              labelText: 'Enter Phone no'.tr,
                              labelStyle: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter OTP'.tr : null,
                            onChanged: (val) {
                              setState(() => otp = val);
                            },
                            decoration: InputDecoration(
                              suffixIcon: TextButton(
                                onPressed: () {
                                  _auth.verifyOTP(otp);
                                },
                                child: Text("Verify".tr),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.teal),
                              ),
                              labelText: 'Enter OTP'.tr,
                              labelStyle: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter Password'.tr : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.teal),
                              ),
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
                              labelText: 'Enter Password'.tr,
                              labelStyle: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (val) => (val != password)
                                ? 'Passwords do not match'
                                : null,
                            onChanged: (val) {
                              setState(() => confirmpassword = val);
                            },
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.teal),
                              ),
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
                              labelText: 'Re-Enter Password'.tr,
                              labelStyle: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 30.0, bottom: 30.0),
                          child: TextButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                dynamic result = await _auth.register(
                                    email, password, name, phone);
                                if (result == null) {
                                  setState(() =>
                                      error = 'Please enter a valid Email Id');
                                }
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'signup'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 1.25),
                            ),
                            style: ButtonStyle(
                                backgroundColor: (MaterialStateProperty.all(
                                    Colors.teal[900])),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                          ),
                        ),
                        Text(error,
                            style: TextStyle(color: Colors.red, fontSize: 14)),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: Text(
                        "Already have an account?".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            letterSpacing: 1.25),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: GestureDetector(
                          child: RichText(
                            text: TextSpan(
                              text: '',
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'login'.tr,
                                  style: TextStyle(
                                      color: Colors.teal[900],
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      fontSize: 14.0,
                                      letterSpacing: 1.25),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                    },
                                ),
                                TextSpan(
                                  text: 'here'.tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      letterSpacing: 1.25),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 10.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
