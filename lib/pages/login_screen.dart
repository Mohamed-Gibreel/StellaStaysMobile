import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 34.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                        onTap: () {}, child: const Icon(Icons.close))
                  ],
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    floatingLabelStyle: TextStyle(
                      color: Constants.mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                    labelStyle: TextStyle(
                      color: Constants.mainColor,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constants.mainColor, width: 1.w)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Constants.mainColor, width: 0.w))),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                obscureText: _passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Constants.mainColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    labelText: "Password",
                    floatingLabelStyle: TextStyle(
                      color: Constants.mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                    labelStyle: TextStyle(
                      color: Constants.mainColor,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constants.mainColor, width: 1.w)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Constants.mainColor, width: 0.w))),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                    color: Constants.mainColor,
                    borderRadius: BorderRadius.circular(24.r)),
                width: double.infinity,
                child: const Center(
                    child: Text("Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white))),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
