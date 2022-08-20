
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventplaner/Model/User_Details.dart';
import 'package:eventplaner/Model/eventModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../constant/Utils.dart';

class Firestore_method{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
static Future  uploadDataToFirestore({required firstname,required lastname,required phone}) async{

     await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set(
       
       {
        "firstname":firstname,
        "lastname":lastname,
      "phone":phone,
    //  "address":address,
      } 
      );
  }
//
 Future<User_Details?> getUserDetails()async {
    DocumentSnapshot snapshot= await firebaseFirestore.collection("Users").doc(firebaseAuth.currentUser!.uid).get();
    User_Details user_details=User_Details.getModelFromJson(snapshot.data() as dynamic);
    print("first and last name in getUserDetails");
    print(user_details.firstName);
    print(user_details.phone);
    return user_details;
  }

    static   Future<String> uploadEventToDb({
    required Uint8List? image1,
    required Uint8List? image2,
    required Uint8List? image3,
  
    required String title,
    required String description,
    required double charges,
    required String SellerName,
    required String SellerUid,
    required String Category,
  }) async {
    print(title);
    print(description);
    print(charges);
    print(SellerName);//null
    print(SellerUid);
    print(Category);
    //rawCost.trim();
    String output = "Something went wrong";

    if (
     image1 != null &&image2 != null &&image3 != null 
     && title != "" && description != ""
    && charges != ""
    && SellerName != ""
    && SellerUid != ""
    && Category != ""
    
    ) {
      try {
        String uid = Utils().getUid();
        String uid1 = Utils().getUid();
        String uid2 = Utils().getUid();
        String uid3 = Utils().getUid();
        String url1 = await uploadImageToDatabase(image: image1, uid: uid);
         String url2 = await uploadImageToDatabase(image: image2, uid: uid1);
          String url3 = await uploadImageToDatabase(image: image3, uid: uid2);
       //  String url4 = await uploadImageToDatabase(image: image4, uid: uid3);
        eventModel event = eventModel(
          title: title,
           description: description,
            url1: url1,
             url2: url2, 
             url3: url3,
             // url4: url4, 
               charges: charges, 
               rating: 5, 
               SellerName: SellerName,
                uid: uid,
                 Sellerid: SellerUid, 
                 NoOfRatings:0,
                  Category: Category);
        await FirebaseFirestore.instance
            .collection("events")
            .doc(uid)
            .set(event.getJson());
            print("event uploaded to firestore");
           //  print("Upload event to db done");
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }

    return output;
  }

  static  Future<String> uploadImageToDatabase(
      {required Uint8List? image, required String uid}) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("events").child(uid);
    UploadTask uploadToask = storageRef.putData(image!);
    TaskSnapshot task = await uploadToask;
    print("image uploaded");
    return task.ref.getDownloadURL();

  }
  static  Future<String> uploadProfilePicToDatabase(
      {required Uint8List? image, required String uid}) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("usersProfile").child(uid);
    UploadTask uploadToask = storageRef.putData(image!);
    TaskSnapshot task = await uploadToask;
    print("image uploaded");
    return task.ref.getDownloadURL();

  }

 static Future<List<eventModel>> getDataFromDb()async{
   List<eventModel> Children=[];
   QuerySnapshot<Map<String,dynamic>> snap= await FirebaseFirestore.instance.collection("events").get();
    print(snap.docs.length);
    for (var i = 0; i < snap.docs.length;i++) {

    DocumentSnapshot docsSnap=  snap.docs[i];

    eventModel model=eventModel.fromJson(docsSnap.data() as dynamic);
    //print(model.Category);
  Children.add(model);
    }
    return Children;
  }

 static Future<List<eventModel>> getDataFromCategory({required String Category})async{
  List<eventModel> Children=[];
   QuerySnapshot<Map<String,dynamic>> snap= await FirebaseFirestore.instance.collection("events").where("Category",isEqualTo: Category).get();

    for (var i = 0; i < snap.docs.length;i++) {
    DocumentSnapshot docsSnap=  snap.docs[i];

    eventModel model=eventModel.fromJson(docsSnap.data() as dynamic);
    print(model.Category);
  Children.add(model);
    }
    return Children;
  }

}