import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common.dart';
import '../../../core/palette.dart';
import '../../../core/widgets/login_field.dart';
import '../../guest/screens/cartpage.dart';
import 'adminlogin_screen.dart';

class GuestLogin extends StatefulWidget {
  const GuestLogin({super.key});

  @override
  State<GuestLogin> createState() => _GuestLoginState();
}

class _GuestLoginState extends State<GuestLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/signin_balls.png'),
              SizedBox(height:height*.02),
              Text(
                'Login As Guest',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width*.07,
                ),
              ),
              SizedBox(height:height*.15),
              SizedBox(
                width: width*.9,
                height: height*.1,
                child: LoginField(
                  hintText: 'Email',
                  controller: emailController,
                ),
              ),
              SizedBox(height: height*.03),
              SizedBox(
                width: width*.9,
                height: height*.1,
                child: LoginField(
                  hintText: 'Password',
                  controller: passwordController,
                ),
              ),
              SizedBox(height: height*.1),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                },
                child: Container(
                  width: width * 0.9,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Palette.gradient1, // Set border color to red
                    ),
                  ),
                  child: Center(
                    child: Text(' LOGIN',style: TextStyle(color: Palette.gradient2)),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width*.6,top: height*.01),
                    child: GestureDetector(
                      // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
                      child: Text("You are a admin?",
                          style: TextStyle(color: Colors.grey,fontSize: width*.03)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height*.01),
                    child: GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminLoginScreen())),
                      child: Text("LOGIN",
                          style: TextStyle(color: Colors.grey,fontSize: width*.03,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
