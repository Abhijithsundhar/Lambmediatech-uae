import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lambmediatech/core/common.dart';
import 'package:lambmediatech/feature/login/screens/guestlogin.dart';
import '../../../core/failure.dart';
import '../../../core/palette.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/login_field.dart';
import '../../admin/screens/dashbordscreen.dart';
import '../repository/loginrepositery.dart';

final authProvider = Provider<AuthRepository>((ref) => AuthRepository());

class AdminLoginScreen extends ConsumerStatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  ConsumerState<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends ConsumerState<AdminLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
  Future<void> _signIn() async {
    final loginRepository = ref.read(authProvider);
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showSnackbar('Email and password cannot be empty!');
      return; // Exit the function if empty
    }

    try {
      final user = await loginRepository.signInWithEmailAndPassword(
          email, password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
    } on Failure catch (e) {
      print(email);
      print(password);
      print('password');
      showSnackbar('Login failed: ${e.failure}');
    } catch (e) {
      print('Unexpected error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    final authRepository = ref.read(authProvider); // Access AuthRepository
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/signin_balls.png'), // Assuming the image path is correct
              SizedBox(height: height * 0.02),
              Text(
                'Login As Admin',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.07,
                ),
              ),
              SizedBox(height: height * 0.15),
              SizedBox(
                width: width * 0.9,
                height: height * 0.1,
                child: LoginField(
                  hintText: 'Email',
                  controller: emailController,
                ),
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: width * 0.9,
                height: height * 0.1,
                child: LoginField(
                  hintText: 'Password',
                  controller: passwordController,
                ),
              ),
              SizedBox(height: height * 0.1),
              SizedBox(
                width: width * 0.9,
                height: height * 0.06,
                child: GradientButton(
                  text: ' LOGIN',
                  onPressed:
                      _signIn , // Call the _signIn method
                  isLoading: false,
                ),
              ),
              SizedBox(height: height * 0.01),

              Divider(indent: width * 0.05, endIndent: width * 0.05),
              Text('or', style: TextStyle(color: Colors.grey)),

              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GuestLogin()));
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
                    child: Text('GUEST LOGIN', style: TextStyle(color: Palette.gradient2)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
