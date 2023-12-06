import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/primary_button.dart';
import 'package:mk_aromatic_limited/common/primary_text_field.dart';
import 'package:mk_aromatic_limited/constants/core/assets/app_icons.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/controller/authentication/login/login.dart';
import 'package:mk_aromatic_limited/screen/common screen/choosescreen1.dart';
import 'package:mk_aromatic_limited/screen/signin/forgot password/email_field.dart';
import 'package:mk_aromatic_limited/screen/signup/signup.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late LoginProvider loginProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
  }

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screemHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              height: screemHight * 0.38,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 95, 39),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screemHight * 0.05,
                  ),
                  Center(
                    child: SizedBox(
                      height: 140,
                      child: Image.asset(
                        "assets/images/Logo-Swach-Bharath-and-Goa.png",
                      ),
                    ),
                  ),
                  GlobalVariabels.vertical5,
                  const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Positioned(
              left: 40,
              right: 40,
              top: screemHight * 0.33,
              child: Container(
                height: screemHight * 0.37,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 12,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      TextField(
                        controller: loginProvider.emailController,
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      GlobalVariabels.vertical10,
                      TextField(
                        controller: loginProvider.passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      GlobalVariabels.vertical15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return EmailField();
                                }),
                              );
                            },
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GlobalVariabels.vertical15,
                      Consumer<LoginProvider>(
                          builder: (context, LoginProvider value, _) {
                        return value.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : PrimaryButton(
                                onTap: () async {
                                  value.login(context);
                                },
                                label: "Sign In",
                              );
                      }),
                      GlobalVariabels.vertical10,
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const SignUp();
                            }),
                          );
                        },
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 95, 39),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: screemHight * 0.12,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 120,
                child: Image.asset("assets/images/MK-Aromatic-Logo.png"),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 50,
              right: 0,
              child: Text(
                "Together, towards a plastic litter free Goa",
                style: TextStyle(
                  color: Colors.green.shade300,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: GlobalVariabels.appColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
