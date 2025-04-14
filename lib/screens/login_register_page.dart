import 'package:bal_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:bal_app/widgets/app_bar.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  //user logged in?
  bool isLogin = false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      Get.to( Home());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        userName: _controllerUserName.text,
        password: _controllerPassword.text,
      );
      Get.to( Home());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == ' ' ? '' : ' $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: signInWithEmailAndPassword,
      child: Text(isLogin ? 'Register' : 'Login'),
    );
  }

  Widget _signUpButton() {
    return ElevatedButton(
      onPressed: createUserWithEmailAndPassword,
      child: const Text('Register'),
    );
  }

  // Widget _loginOrRegisterButton(){
  //   return TextButton(
  //     onPressed: () {
  //       setState(() {
  //     isLogin = !isLogin;
  //     });
  //     }, child: Text(isLogin ? 'Register ' : 'Login'),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SignIn',
        leading: const Image(image: AssetImage('/icon/logo.png')),
        backgroundColor: Colors.white54,
        actions: const [
          Text("Login"),
          Icon(Icons.account_circle_outlined),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('Email@example.com', _controllerEmail),
            _entryField('Preferred Username', _controllerUserName),
            _entryField('Password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _signUpButton(),
          ],
        ),
      ),
    );
  }
}
