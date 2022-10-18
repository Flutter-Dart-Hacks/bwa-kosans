class CityData {
  int id = 0;
  String name = '';
  String imageUrl = '';
  bool isFavorite = false;

  CityData(
      {required this.id,
      required this.name,
      required this.imageUrl,
      this.isFavorite = false});
}
