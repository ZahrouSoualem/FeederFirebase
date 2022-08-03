class ProductModel {
  String proName;
  String proType;
  double proPrice;
  String proDescreption;
  int proTiming;
  double proRate;
  String proImage;
  String id;

  ProductModel(
      {required this.id,
      required this.proName,
      required this.proType,
      required this.proPrice,
      required this.proDescreption,
      required this.proTiming,
      required this.proRate,
      required this.proImage});


  Map<String, dynamic> toFirestore() {
    return {
      "name": this.proName,
      "type": this.proType,
      "descreption": this.proDescreption,
      "price": this.proPrice,
      "rate": this.proRate,
      "timing": this.proTiming,
      "image": this.proImage
    };
  }
}
