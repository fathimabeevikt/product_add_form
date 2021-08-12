import 'package:productaddingform/model/seller_info.dart';
import 'package:productaddingform/model/variant_info.dart';

class StocksProvider {
  static Seller GetStocks() {
    List<Variation> _variantsList = [
      new Variation(type: 'klkk', price: 3200.01, sku: 'jcadet', qty: 46),
      new Variation(type: 'kfdfs', price: 3210.01, sku: 'jcadet-25', qty: 26),
    ];

    return new Seller(
        sellerId: 1,
        unitPrice: 1000,
        variation: _variantsList,
        shopName: 'pathus',
        shopLocation: 'kavanoor',
        shopImage:
            "https://m.media-amazon.com/images/I/71e+PwfDV8L._SX569._SX._UX._SY._UY_.jpg",
        minQty: 2,
        tax: 10,
        taxType: 'normal',
        discount: 2,
        discountType: 'percentage',
        currentStock: 5,
        freeShipping: 4,
        acceptReturns: 1);
  }
}
