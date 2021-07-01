import 'dart:convert';



class MakeUpModel {
  static List<Item> items = [];

}

class Item {
  final int id;
  final String brand;
  final String name;
  final String price;
  final String image_link;
  final String description;
  final double rating;
  final String product_type;
  final String product_api_url;
  final String api_featured_image;

  Item(
    this.id,
    this.brand,
    this.name,
    this.price,
    this.image_link,
    this.description,
    this.rating,
    this.product_type,
    this.product_api_url,
    this.api_featured_image,
  );



  Item copyWith({
    int? id,
    String? brand,
    String? name,
    String? price,
    String? image_link,
    String? description,
    double? rating,
    String? product_type,
    String? product_api_url,
    String? api_featured_image,
  }) {
    return Item(
      id ?? this.id,
      brand ?? this.brand,
      name ?? this.name,
      price ?? this.price,
      image_link ?? this.image_link,
      description ?? this.description,
      rating ?? this.rating,
      product_type ?? this.product_type,
      product_api_url ?? this.product_api_url,
      api_featured_image ?? this.api_featured_image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'name': name,
      'price': price,
      'image_link': image_link,
      'description': description,
      'rating': rating,
      'product_type': product_type,
      'product_api_url': product_api_url,
      'api_featured_image': api_featured_image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'],
      map['brand'],
      map['name'],
      map['price'],
      map['image_link'],
      map['description'],
      map['rating'],
      map['product_type'],
      map['product_api_url'],
      map['api_featured_image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, brand: $brand, name: $name, price: $price, image_link: $image_link, description: $description, rating: $rating, product_type: $product_type, product_api_url: $product_api_url, api_featured_image: $api_featured_image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.brand == brand &&
      other.name == name &&
      other.price == price &&
      other.image_link == image_link &&
      other.description == description &&
      other.rating == rating &&
      other.product_type == product_type &&
      other.product_api_url == product_api_url &&
      other.api_featured_image == api_featured_image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      brand.hashCode ^
      name.hashCode ^
      price.hashCode ^
      image_link.hashCode ^
      description.hashCode ^
      rating.hashCode ^
      product_type.hashCode ^
      product_api_url.hashCode ^
      api_featured_image.hashCode;
  }
}
