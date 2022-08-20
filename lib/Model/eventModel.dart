
class eventModel {
  final String title;
  final String description;
  final String url1;
  final String url2;
  final String url3;
 // final String url4;
  final double charges;
  final int rating;
  final String SellerName;
  final String uid;
  final String Sellerid;
  final int NoOfRatings;
  //final Color color;
  final String Category;

  eventModel(
      {required this.title,
      required this.description,
      required this.url1,
      required this.url2,
      required this.url3,
    //  required this.url4,
      required this.charges,
      required this.rating,
      required this.SellerName,
      required this.uid,
      required this.Sellerid,
      required this.NoOfRatings,
      required this.Category});
  Map<String, dynamic> getJson() {
    return {
      'title':title,
      'Description': description,
      'url1': url1,
      'url2': url2,
      'url3': url3,
     // 'url4': url4,
      
      'charges':charges,
      'uid': uid,
      'sellerName': SellerName,
      'sellerUid': uid,
      'rating': rating,
      'noOfRating': NoOfRatings,
      'Category': Category,
    //  'color':color
    };
  }

  factory eventModel.fromJson(Map<String,dynamic> json) {
      return 
      eventModel(
        title:json['title'],
         description: json['Description'], 
         url1: json['url1'],
         url2: json['url2'],
         url3: json['url3'],
      //   url4: json['url4'],
          charges:json['charges'], 
           rating: json['rating'],
            SellerName:json['sellerName'], 
            uid: json['uid'],
             Sellerid: json['sellerUid'], 
             NoOfRatings:json['noOfRating'],
              Category: json['Category']);
  }
}

