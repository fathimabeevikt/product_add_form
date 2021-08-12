// To parse this JSON data, do
//
//     final seller = sellerFromJson(jsonString);

import 'dart:convert';

import 'package:productaddingform/model/variant_info.dart';

Seller sellerFromJson(String str) => Seller.fromJson(json.decode(str));

String sellerToJson(Seller data) => json.encode(data.toJson());

class Seller {
  Seller({
    this.sellerId,
    this.unitPrice,
    required this.variation,
    this.shopName,
    this.shopLocation,
    this.shopImage,
    this.minQty,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.currentStock,
    this.freeShipping,
    this.acceptReturns,
  });

  int? sellerId;
  double? unitPrice;
  List<Variation> variation = [];
  String? shopName;
  String? shopLocation;
  String? shopImage;
  int? minQty;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  int? currentStock;
  int? freeShipping;
  int? acceptReturns;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        sellerId: json["seller_id"],
        unitPrice: json["unit_price"].toDouble(),
        variation: List<Variation>.from(
            json["variation"].map((x) => Variation.fromJson(x))),
        shopName: json["shop_name"],
        shopLocation: json["shop_location"],
        shopImage: json["shop_image"],
        minQty: json["min_qty"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: json["discount"],
        discountType: json["discount_type"],
        currentStock: json["current_stock"],
        freeShipping: json["free_shipping"],
        acceptReturns: json["accept_returns"],
      );

  Map<String, dynamic> toJson() => {
        "seller_id": sellerId,
        "unit_price": unitPrice,
        "variation": List<dynamic>.from(variation.map((x) => x.toJson())),
        "shop_name": shopName,
        "shop_location": shopLocation,
        "shop_image": shopImage,
        "min_qty": minQty,
        "tax": tax,
        "tax_type": taxType,
        "discount": discount,
        "discount_type": discountType,
        "current_stock": currentStock,
        "free_shipping": freeShipping,
        "accept_returns": acceptReturns,
      };
}
