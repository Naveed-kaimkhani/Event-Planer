
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
        "lastname":firstname,
        "phone":phone,
     // "address":address,
      } 
      );
  }

 Future<User_Details?> getUserDetails()async {
    DocumentSnapshot snapshot= await firebaseFirestore.collection("Users").doc(firebaseAuth.currentUser!.uid).get();
    User_Details user_details=User_Details.getModelFromJson(snapshot.data() as dynamic);
    return user_details;
  }

    static   Future<String> uploadEventToDb({
    required Uint8List? image1,
    required Uint8List? image2,
    required Uint8List? image3,
    required Uint8List? image4,
    required String title,
    required String description,
    required double charges,
    required String SellerName,
    required String SellerUid,
    required String Category,
  }) async {
    
    //rawCost.trim();
    String output = "Something went wrong";

    if (
     image1 != null &&image2 != null &&image3 != null 
    &&image4 != null && title != "" && description != ""
    && charges != ""
    && SellerName != ""
    && SellerUid != ""
    && Category != ""
    
    ) {
      try {
        String uid = Utils().getUid();
        String url1 = await uploadImageToDatabase(image: image1, uid: uid);
         String url2 = await uploadImageToDatabase(image: image2, uid: uid);
          String url3 = await uploadImageToDatabase(image: image3, uid: uid);
         String url4 = await uploadImageToDatabase(image: image4, uid: uid);
        eventModel event = eventModel(
          title: title,
           description: description,
            url1: url1,
             url2: url2, 
             url3: url3,
              url4: url4,
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

//  static Future<List<Widget>> getDataFromCategory({required String Category})async{
//    List<Widget> Children=[];
//    QuerySnapshot<Map<String,dynamic>> snap= await FirebaseFirestore.instance.collection("products").where("Category",isEqualTo: Category).get();

//     for (var i = 0; i < snap.docs.length;i++) {
//     DocumentSnapshot docsSnap=  snap.docs[i];

//     Product model=Product.fromJson(docsSnap.data() as dynamic);
//   Children.add(ProductItem(product: model));
//     }
//     return Children;
//   }

//   Future<void> UploadReview({required ReviewModel review,required String uid}) async{

//       await firebaseFirestore.collection("products").doc(uid).collection("review").add(review.getjson());
//         await changeAverageRating(productUid: uid, review: review);
//   }
   
   
//  static Future<void> AddToCart({required Product product}) async{

//       await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").doc(product.uid).set(product.getJson());
//   }
   
//   static Future deleteProductFromCart({required String uid})async{
//     await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").doc(uid).delete(); 
//    }

//   static Future BuyProductFromCart({required User_Details? user})async{
//   QuerySnapshot<Map<String,dynamic>>  snapshot = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").get(); 
//      for (var i = 0; i < snapshot.docs.length;i++) {
//     DocumentSnapshot docsSnap=  snapshot.docs[i];

//     Product model=Product.fromJson(docsSnap.data() as dynamic);
//     addProductsToOrders(product: model,user: user);
    
   
//    }
//   }
// static Future addProductsToOrders({required Product product,required User_Details? user})async{
//     await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("orders").add(product.getJson()); 
//   await deleteProductFromCart(uid: product.uid);
//     await orderRequest(product: product , user: user!);  
//    }

// static Future orderRequest({required Product product,required User_Details user})async{
// OrderRequestModel order=OrderRequestModel(name: product.ProductName, address:"somewhere on earth");
// await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("OrderRequest").add(order.getJson(order));
// }
// Future changeAverageRating({required String productUid,required ReviewModel review}) async{
//  DocumentSnapshot snapshot=await FirebaseFirestore.instance.collection("products").doc(productUid).get();
//   Product productModel=Product.fromJson(snapshot.data() as dynamic);
//   int currentRating=productModel.rating;
//   int newRating=(currentRating+review.rating)~/2;
//   FirebaseFirestore.instance.collection("products").doc(productUid).update({
//     "rating":newRating},
//   ) ;
// }

// Future<User_Details?> getUserDetails()async {
//     DocumentSnapshot snapshot= await firebaseFirestore.collection("Users").doc(firebaseAuth.currentUser!.uid).get();
//     User_Details user_details=User_Details.getModelFromJson(snapshot.data() as dynamic);
//   return user_details;
//   }
}