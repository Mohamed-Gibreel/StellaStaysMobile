import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:stella_stays_mobile/constants.dart';
import 'package:stella_stays_mobile/state/state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordNode = FocusNode();

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Provider.of<AppState>(context, listen: false).loginUser(userCredential);
      debugPrint('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
      debugPrint("USER LOGGED IN ");
      print(userCredential);
      debugPrint('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
      Navigator.pushNamedAndRemoveUntil(
          context, "/", (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      //Could have used Get snack bar for a more appealing message, but I do not
      // want to bloat the application with plugins.
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("No user found with the given details."),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Wrong password provided for that user."),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Something went wrong! Please try again."),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Form(
        key: formKey,
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Email is required"),
                    EmailValidator(errorText: "Invalid Email"),
                  ]),
                  controller: emailController,
                  onEditingComplete: () {
                    passwordNode.requestFocus();
                  },
                  focusNode: emailNode,
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
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Constants.mainColor, width: 1.w)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Constants.mainColor, width: 1.w)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Constants.mainColor, width: 1.w)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Constants.mainColor, width: 0.w))),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  controller: passwordController,
                  focusNode: passwordNode,
                  obscureText: !_passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          !_passwordVisible
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
                          borderSide: BorderSide(
                              color: Constants.mainColor, width: 1.w)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Constants.mainColor, width: 0.w))),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        emailController.text = "developertest@stellastays.com";
                        passwordController.text = "DevTest123!@#";
                      });
                    },
                    child: Text("Fill details")),
                GestureDetector(
                  onTap: loading
                      ? null
                      : () async {
                          if (formKey.currentState?.validate() ?? false) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              loading = true;
                            });
                            await signIn(
                                emailController.text, passwordController.text);

                            setState(() {
                              loading = false;
                            });
                          }
                        },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: loading ? Colors.grey : Constants.mainColor,
                        borderRadius: BorderRadius.circular(24.r)),
                    width: double.infinity,
                    child: Center(
                        child: loading
                            ? const CupertinoActivityIndicator()
                            : const Text("Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
