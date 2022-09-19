import 'package:chatapp/Controllers/login_Controller.dart';
import 'package:chatapp/widgets/custom_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:chatapp/widgets/custom_Textfield.dart';
import 'package:flutter/material.dart';

import 'image_picker/userimage_picker.dart';

class AuthForm extends StatelessWidget {
  AuthForm(this.submitfn, this.isloading);
  final bool isloading;
  final void Function(
    String email,
    String password,
    String username,
    bool islogin,
  ) submitfn;

  // AuthForm({super.key});
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginController c = Get.put(loginController());
    void trysubmit() {
      final isvalid = _formkey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isvalid) {
        _formkey.currentState!.save();
        submitfn(emailcontroller.text.trim(), passwordcontroller.text.trim(),
            usercontroller.text.trim(), c.islogin);
      }
    }

    return Center(
      child: Card(
        //color: Colors.grey,
        margin: EdgeInsets.all(18),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  GetBuilder<loginController>(builder: (context) {
                    if (!c.islogin) {
                      return UserImage();
                    } else {
                      return Text('');
                    }
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  CusTomEmailTextFormField(
                      Valuekey: 'Email',
                      hintTxt: 'Email',
                      obscure: false,
                      controller: emailcontroller,
                      suffixIcon: Icons.email_outlined),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<loginController>(builder: (context) {
                    if (!c.islogin) {
                      return CusTomTextFormField(
                          Valuekey: 'Password',
                          hintTxt: 'Username',
                          obscure: false,
                          controller: usercontroller,
                          suffixIcon: Icons.person);
                    } else {
                      return Text('');
                    }
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  CusTomTextFormField(
                      Valuekey: 'UserName',
                      hintTxt: 'Password',
                      obscure: true,
                      controller: passwordcontroller,
                      suffixIcon: Icons.lock),
                  SizedBox(
                    height: 15,
                  ),
                  if (isloading) CircularProgressIndicator(),
                  if (!isloading)
                    InkWell(
                      onTap: trysubmit,
                      child: GetBuilder<loginController>(builder: (context) {
                        return CustomButton(
                            buttonTitle: c.islogin ? 'Login' : 'Signup',
                            bgColor: Colors.amber,
                            borderColor: Colors.white,
                            textColor: Colors.white);
                      }),
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  if (!isloading)
                    TextButton(onPressed: () {
                      c.SetScreen();
                    }, child: GetBuilder<loginController>(builder: (context) {
                      return Text(
                        c.islogin
                            ? 'Dont have an account? Signup'
                            : ' Already have an account? Login',
                        style: TextStyle(color: Colors.blue),
                      );
                    }))
                ],
              )),
        ),
      ),
    );
  }
}
