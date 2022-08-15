class Seller {
  final int sellerId;
  final String sellerName;
  final double rating;
  final String imageURL;
  final String decription;

  Seller(
      {required this.sellerId,
      required this.sellerName,
      required this.rating,
      required this.imageURL,
      required this.decription});

  //List of Plants data
  static List<Seller> sellerList = [
    Seller(
      sellerId: 0,
      sellerName: 'Spider man',
      rating: 22000,
      imageURL: 'assets/s1.jpeg',
      decription: 'Indoor birthday event',
    ),
    Seller(
      sellerId: 0,
      sellerName: 'IronMan',
      rating: 22000,
      imageURL: 'assets/s2.jpeg',
      decription: 'Indoor birthday event',
    ),
    Seller(
      sellerId: 0,
      sellerName: 'Hulk',
      rating: 22000,
      imageURL: 'assets/s3.jpeg',
      decription: 'Indoor birthday event',
    ),
  ];

  //Get the favorated items
  // static List<Seller> getFavoritedEvent() {
  //   List<Seller> _travelList = Seller.sellerList;
  //   return _travelList.where((element) => element.isFavorated == true).toList();
  // }
}
