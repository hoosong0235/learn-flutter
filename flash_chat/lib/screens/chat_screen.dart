import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static String route = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late FirebaseApp firebaseApp;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController textEditingController = TextEditingController();
  String text = '';

  void initFirebase() async {
    firebaseApp = await Firebase.initializeApp();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                firebaseAuth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: firebaseFirestore
                  .collection('messages')
                  .orderBy('time', descending: false)
                  .snapshots(),
              builder: ((context, snapshot) {
                try {
                  List<Widget> messagesList = [];
                  final messages = snapshot.data!.docs.reversed;
                  for (var message in messages) {
                    String sender = message['sender'];
                    String text = message['text'];

                    messagesList.add(
                      Column(
                        crossAxisAlignment:
                            sender == firebaseAuth.currentUser!.email
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 16.0,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 16.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: sender ==
                                            firebaseAuth.currentUser!.email
                                        ? Offset(2, 2)
                                        : Offset(-2, 2))
                              ],
                              borderRadius:
                                  sender == firebaseAuth.currentUser!.email
                                      ? BorderRadius.only(
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                          topLeft: Radius.circular(32))
                                      : BorderRadius.only(
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                          topRight: Radius.circular(32)),
                              color: sender == firebaseAuth.currentUser!.email
                                  ? Colors.blue.shade300
                                  : Colors.purple.shade300,
                            ),
                            child: Text(
                              "${text}",
                              style: TextStyle(
                                color: sender == firebaseAuth.currentUser!.email
                                    ? Colors.white
                                    : Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Expanded(
                      child: ListView(
                    reverse: true,
                    children: messagesList,
                  ));
                } catch (e) {
                  print(e);
                  return Container();
                }
              }),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (value) {
                        //Do something with the user input.
                        setState(() => text = value);
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //Implement send functionality.
                      try {
                        await firebaseFirestore.collection('messages').add({
                          'sender': firebaseAuth.currentUser?.email,
                          'text': text,
                          'time': DateTime.now(),
                        });
                        textEditingController.clear();
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
