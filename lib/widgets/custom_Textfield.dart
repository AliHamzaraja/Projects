import 'package:flutter/material.dart';

class CusTomTextFormField extends StatelessWidget {
  String hintTxt;
  String Valuekey;
  TextEditingController controller;

  bool? obscure;
  IconData? suffixIcon;

  CusTomTextFormField({
    required this.hintTxt,
    required this.Valuekey,
    this.obscure,
    required this.controller,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: controller,
            key: ValueKey(Valuekey),
            validator: (value) {
              if (value!.isEmpty || value.length < 7) {
                return 'Plz Enter value of 7 digits';
              }
            },
            obscureText: obscure!,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Color(0xff04a4a4),
            decoration: InputDecoration(
                hintText: hintTxt,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(suffixIcon, color: Color(0xff04a4a4)),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(letterSpacing: 2)),
          )),
    );
  }
}

class CusTomEmailTextFormField extends StatelessWidget {
  String hintTxt;
  TextEditingController controller;
  String Valuekey;

  bool? obscure;
  IconData? suffixIcon;

  CusTomEmailTextFormField({
    required this.hintTxt,
    required this.Valuekey,
    this.obscure,
    required this.controller,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            key: ValueKey(Valuekey),
            controller: controller,
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Plz Enter valid email';
              }
            },
            obscureText: obscure!,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Color(0xff04a4a4),
            decoration: InputDecoration(
                hintText: hintTxt,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(suffixIcon, color: Color(0xff04a4a4)),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(letterSpacing: 2)),
          )),
    );
  }
}
