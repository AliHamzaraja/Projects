import 'package:chatapp/Controllers/login_Controller.dart';
import 'package:chatapp/widgets/authForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final loginController c = Get.put(loginController());

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    void _submitAuthForm(
      String email,
      String password,
      String username,
      bool islogin,
    ) async {
      try {
        GetBuilder<loginController>(
          builder: (context) {
            return c.changeloadingtrue();
          },
        );

        UserCredential authresult;
        if (islogin) {
          authresult = await auth.signInWithEmailAndPassword(
              email: email, password: password);
          //Get.snackbar('Login', "success");
        } else {
          authresult = await auth.createUserWithEmailAndPassword(
              email: email, password: password);
          //Get.snackbar('Register', "success");
          await FirebaseFirestore.instance
              .collection('users')
              .doc(authresult.user!.uid)
              .set({'username': username, 'email': email});
        }
      } on PlatformException catch (e) {
        var message = 'An Error occurred Plz Check your Credentials';
        if (e.message != null) {
          message = e.message.toString();
        }
        Get.snackbar(
          'Error',
          message,
          icon: Icon(Icons.warning),
          backgroundColor: Colors.white,
        );
        GetBuilder<loginController>(
          builder: (context) {
            return c.changeloadingfalse();
          },
        );
      } catch (err) {
        print(err);
        Get.snackbar(
          'Error',
          err.toString(),
          icon: Icon(Icons.warning),
          backgroundColor: Colors.white,
        );
        GetBuilder<loginController>(
          builder: (context) {
            return c.changeloadingfalse();
          },
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Container(
        child: AuthForm(
          _submitAuthForm,
          c.isloading,
        ),
      ),
    );
  }
}
