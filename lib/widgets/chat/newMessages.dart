import 'package:chatapp/Controllers/smsController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class NewMessages extends StatelessWidget {
  NewMessages({super.key});

  var msgcontroller = TextEditingController();
  void SendMessages(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser;
    final userdata = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    FirebaseFirestore.instance.collection('chats').add(
      {
        'text': msgcontroller.text,
        'createdAt': Timestamp.now(),
        'userid': user.uid,
        'username': userdata['username'],
      },
    );
    msgcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: msgcontroller,
                decoration: InputDecoration(
                    label: Text('Send Message'), hintText: 'Enter Message'),
              ),
            ),
            IconButton(
                color: Colors.blue,
                icon: Icon(
                  Icons.send,
                ),
                onPressed: () {
                  if (msgcontroller.text.isEmpty) {
                    return null;
                  } else {
                    SendMessages(context);
                  }
                }

                // SendMessages,
                )
          ],
        ));
  }
}
