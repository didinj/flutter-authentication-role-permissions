class Products {
  final int? id;
  final String? prodName;
  final String? prodDescription;
  final String? prodImage;
  final int? prodPrice;
  final String? createdAt;
  final String? updatedAt;

  Products({this.id, this.prodName, this.prodDescription, this.prodImage, this.prodPrice, this.createdAt, this.updatedAt});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'] as int,
        prodName: json['prod_name'] as String,
        prodDescription: json['prod_description'] as String,
        prodImage: json['prod_image'] as String,
        prodPrice: int.parse(json['prod_price'] as String),
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String);
  }

  @override
  String toString() {
    return 'Products{name: $prodName}';
  }
}