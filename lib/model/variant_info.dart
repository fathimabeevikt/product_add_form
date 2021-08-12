class Variation {
  Variation({
    this.type,
    this.price,
    this.sku,
    this.qty,
  });

  String? type;
  double? price;
  String? sku;
  int? qty;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        type: json["type"],
        price: json["price"].toDouble(),
        sku: json["sku"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
        "sku": sku,
        "qty": qty,
      };
}
