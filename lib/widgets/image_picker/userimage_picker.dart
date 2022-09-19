import 'dart:io';

import 'package:chatapp/Controllers/imageController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserImage extends StatefulWidget {
  UserImage({super.key});

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No Image Selected');
  }

  Uint8List? _imageURL;
  selectedImage() async {
    Uint8List imageURL = await pickImage(
      ImageSource.gallery,
    );
    setState(() {
      _imageURL = imageURL;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _imageURL != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(image: MemoryImage(_imageURL!))),
                  width: 90,
                  height: 90,
                  // child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(10),
                  //     child: Image(
                  //       image: MemoryImage(_imageURL!),
                  //     )),
                ),
              )
            : Text(''),
        TextButton.icon(
          onPressed: () => selectedImage(),
          icon: Icon(Icons.camera),
          label: Text('Add image'),
        )
      ],
    );
  }
}
