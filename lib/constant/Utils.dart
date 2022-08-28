import 'dart:ffi';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
static void MakeCall({String? phoneNo}) async {
    final _call = 'tel:$phoneNo';
    if (await canLaunch(_call)) {
      await launch(_call);
    }
  }
  static void message({String? phoneNo}) async {
    final _mess = 'sms:$phoneNo';
    if (await canLaunch(_mess)) {
      await launch(_mess);
    }
  }
  
  

  // Future<Uint8List?> PickImage() async {
  //     ImagePicker picker=ImagePicker();

  //     XFile? file= await picker.pickImage(source: ImageSource.gallery);
  //     return file!.readAsBytes();
  //   }
String getUid() {
    return (100000 + Random().nextInt(10000)).toString();
  }

   Future<Uint8List?> PickImage() async {
  //    ImagePicker picker=ImagePicker();
  ImagePicker picker =ImagePicker();
      XFile? file= await picker.pickImage(source: ImageSource.gallery);
      
      //  return Image!.network("https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png");
     if (file!=null) {
       return file.readAsBytes();
     } 
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


