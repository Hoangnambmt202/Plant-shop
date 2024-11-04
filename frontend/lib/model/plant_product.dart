class PlantProduct{
  final String? image;
  final String? name;
  final double? price;
  final int? id;
  final String? detailImage;
  final String? category;
  List? plantimages;
  int quntity;
  bool initialvalue;
  /*
  final String? image;
  final String? name;
  final double? price;
  final int? id;
  final String? detailImage;
  List? plantimages;
  int quntity;
  bool initialvalue;

   */

  PlantProduct({this.image, this.name, this.price, this.id,required this.initialvalue,required this.quntity,this.detailImage,this.plantimages,this.category});
}