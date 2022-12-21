class SpaceData {
  int id = 0;
  String name = '';
  String imageUrl = '';
  int price = 0;
  String city = '';
  String country = '';
  int rating = 0;
  String address = "";
  String phone = "";
  String mapUrl = "";
  List listPhotos = [];
  int numberOfKitchens = 0;
  int numberOfBedrooms = 0;
  int numberOfCupboards = 0;

  SpaceData(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.city,
      required this.country,
      required this.rating,
      required this.address,
      required this.phone,
      required this.mapUrl,
      required this.listPhotos,
      required this.numberOfKitchens,
      required this.numberOfBedrooms,
      required this.numberOfCupboards});

  SpaceData.fromJsons(jsondata) {
    id = jsondata['id'];
    name = jsondata['name'];
    imageUrl = jsondata['image_url'];
    price = jsondata['price'];
    city = jsondata['city'];
    country = jsondata['country'];
    rating = jsondata['rating'];
    address = jsondata['address'];
    phone = jsondata['phone'];
    mapUrl = jsondata['map_url'];
    listPhotos = jsondata['photos'];
    numberOfKitchens = jsondata['number_of_kitchens'];
    numberOfBedrooms = jsondata['number_of_bedrooms'];
    numberOfCupboards = jsondata['number_of_cupboards'];
  }
}
