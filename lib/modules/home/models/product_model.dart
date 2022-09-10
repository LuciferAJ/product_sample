class Product {
  int? id;
  String? productName;
  String? productBrand;
  double? price;
  Product({this.id, this.price, this.productBrand, this.productName});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    productBrand = json['productBrand'];
    price = json['price'];
  }
}
