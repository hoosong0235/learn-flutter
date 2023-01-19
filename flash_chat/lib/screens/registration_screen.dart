import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegistrationScreen extends StatefulWidget {
  static String route = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late FirebaseApp firebaseApp;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    firebaseApp = await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                setState(() => email = value);
              },
              decoration:
                  kInputDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  setState(() => password = value);
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your password')),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Button(
                color: Colors.blueAccent,
                string: 'Register',
                onPressed: () async {
                  EasyLoading.show(status: 'Register');
                  try {
                    final user =
                        await firebaseAuth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    Navigator.pushNamed(context, ChatScreen.route);
                    EasyLoading.dismiss();
                  } catch (e) {
                    print(e);
                    EasyLoading.dismiss();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
