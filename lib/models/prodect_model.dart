// ignore_for_file: prefer_const_constructors

class ProdectModel {
  int? id; // يجب أن يكون من النوع int
  String? title;
  double? price; // يمكن أن يكون من النوع double
  String? description;
  String? category;
  String? image;
  
  Rating? rating;

  ProdectModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProdectModel.fromJson(Map<String, dynamic> json) {
    return ProdectModel(
      id: json['id'], // يجب أن تكون قيمة صحيحة من نوع int
      title: json['title'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'] as double?, // تحويل price إذا لزم الأمر
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = (json['rate'] is int) ? (json['rate'] as int).toDouble() : json['rate'] as double?; // تحويل rate إذا لزم الأمر
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
