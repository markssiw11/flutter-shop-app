import 'dart:convert';

class CartItem {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  final String content;
  final int quantity;
  CartItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
    required this.content,
    required this.quantity,

  });

  CartItem copyWith({
    num? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
    String? content,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
      content: content ?? this.content,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
      'content': content,
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
      content: map['content'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartItem(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image, content: $content, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CartItem &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.price == price &&
      other.color == color &&
      other.image == image &&
      other.content == content &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      image.hashCode ^
      content.hashCode ^
      quantity.hashCode;
  }
}
