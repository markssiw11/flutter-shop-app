import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {}

class Item {
  final int id;
  final String name;
  final String imgUrl;
  final String price;
  final List<OptionProduct> options;

  Item(
    this.id,
    this.name,
    this.imgUrl,
    this.price,
    this.options,
  );

  Item copyWith({
    int? id,
    String? name,
    String? imgUrl,
    String? price,
    List<OptionProduct>? options,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      imgUrl ?? this.imgUrl,
      price ?? this.price,
      options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imgUrl': imgUrl,
      'price': price,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'],
      map['name'],
      map['imgUrl'],
      map['price'],
      List<OptionProduct>.from(map['options']?.map((x) => OptionProduct.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, imgUrl: $imgUrl, price: $price, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.name == name &&
      other.imgUrl == imgUrl &&
      other.price == price &&
      listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      imgUrl.hashCode ^
      price.hashCode ^
      options.hashCode;
  }
}

class OptionProduct {
  final int id;
  final String giftId;
  final String percentDiscount;
  final String quantity;
  final String voucherType;
  final String createdAt;
  final String updatedAt;
  final String giftName;
  final String giftImgUrl;

  OptionProduct(
    this.id,
    this.giftId,
    this.percentDiscount,
    this.quantity,
    this.voucherType,
    this.createdAt,
    this.updatedAt,
    this.giftName,
    this.giftImgUrl,
  );


  OptionProduct copyWith({
    int? id,
    String? giftId,
    String? percentDiscount,
    String? quantity,
    String? voucherType,
    String? createdAt,
    String? updatedAt,
    String? giftName,
    String? giftImgUrl,
  }) {
    return OptionProduct(
      id ?? this.id,
      giftId ?? this.giftId,
      percentDiscount ?? this.percentDiscount,
      quantity ?? this.quantity,
      voucherType ?? this.voucherType,
      createdAt ?? this.createdAt,
      updatedAt ?? this.updatedAt,
      giftName ?? this.giftName,
      giftImgUrl ?? this.giftImgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'giftId': giftId,
      'percentDiscount': percentDiscount,
      'quantity': quantity,
      'voucherType': voucherType,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'giftName': giftName,
      'giftImgUrl': giftImgUrl,
    };
  }

  factory OptionProduct.fromMap(Map<String, dynamic> map) {
    return OptionProduct(
      map['id'],
      map['giftId'],
      map['percentDiscount'],
      map['quantity'],
      map['voucherType'],
      map['createdAt'],
      map['updatedAt'],
      map['giftName'],
      map['giftImgUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionProduct.fromJson(String source) => OptionProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OptionProduct(id: $id, giftId: $giftId, percentDiscount: $percentDiscount, quantity: $quantity, voucherType: $voucherType, createdAt: $createdAt, updatedAt: $updatedAt, giftName: $giftName, giftImgUrl: $giftImgUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OptionProduct &&
      other.id == id &&
      other.giftId == giftId &&
      other.percentDiscount == percentDiscount &&
      other.quantity == quantity &&
      other.voucherType == voucherType &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.giftName == giftName &&
      other.giftImgUrl == giftImgUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      giftId.hashCode ^
      percentDiscount.hashCode ^
      quantity.hashCode ^
      voucherType.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      giftName.hashCode ^
      giftImgUrl.hashCode;
  }
}
