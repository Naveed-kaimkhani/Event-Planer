import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Utils {

  // Future<Uint8List?> PickImage() async {
  //     ImagePicker picker=ImagePicker();

  //     XFile? file= await picker.pickImage(source: ImageSource.gallery);
  //     return file!.readAsBytes();
  //   }
String getUid() {
    return (100000 + Random().nextInt(10000)).toString();
  }
  static showSnackBar(
      {required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        content: SizedBox(
          width:MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
