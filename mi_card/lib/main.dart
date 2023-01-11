import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                Text(
                  'Seungho Jang',
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  'KAIST 21 SoC',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Colors.teal.shade100,
                    fontSize: 15.0,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                  width: 250.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(50.0, 2.5, 50.0, 2.5),
                  child: ListTile(
                    dense: true,
                    //visualDensity: VisualDensity(vertical: -2.5),
                    leading: Icon(
                      Icons.computer,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'https://github.com/hoosong0235',
                      style: TextStyle(
                        color: Colors.teal,
                        fontFamily: 'OpenSans',
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(50.0, 2.5, 50.0, 2.5),
                  child: ListTile(
                    dense: true,
                    //visualDensity: VisualDensity(vertical: -2.5),
                    leading: Icon(
                      Icons.photo_camera,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'https://www.instagram.com/hocking_0235',
                      style: TextStyle(
                        color: Colors.teal,
                        fontFamily: 'OpenSans',
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
