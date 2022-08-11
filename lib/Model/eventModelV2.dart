class Event {
  final int eventId;
  final int package;
  final String eventName;
  final double rating;
  final String category;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Event(
      {required this.eventId,
        required this.package,
        required this.eventName,
        required this.category,
        required this.rating,
        required this.imageURL,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  //List of Plants data
  static List<Event> eventList = [
    Event(
        eventId: 0,
        eventName: '22 birthday',
        package: 22000,
        category: 'Indoor',
        rating: 4.5,
        imageURL: 'assets/th.jpeg',
        isFavorated: true,
        decription:
        'Indoor birthday event',
        isSelected: false),
    Event(
        eventId: 0,
        eventName: 'Bridal shower',
        package: 22000,
        category: 'Indoor',
        rating: 4.5,
        imageURL: 'assets/th2.jpeg',
        isFavorated: true,
        decription:
        'Indoor birthday event',
        isSelected: false),
    Event(
        eventId: 0,
        package: 22000,
        category: 'Outdoor',
        eventName: 'wedding',
        rating: 4.5,
        imageURL: 'assets/th1.jpeg',
        isFavorated: true,
        decription:
        'Indoor birthday event',
        isSelected: false),

  ];

  //Get the favorated items
  static List<Event> getFavoritedEvent(){
    List<Event> _travelList = Event.eventList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

}