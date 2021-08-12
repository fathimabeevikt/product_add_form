import 'package:flutter/material.dart';
import 'package:productaddingform/model/seller_info.dart';
import 'provider/stokeprovider.dart';

import 'constants.dart';
import 'model/variant_info.dart';

class Variants extends StatefulWidget {
  const Variants({Key? key}) : super(key: key);

  @override
  _VariantsState createState() => _VariantsState();
}

class _VariantsState extends State<Variants> {
  // List<StokeInfo> _stokeList = [StokeInfo(889, 88997),];

  var seller = StocksProvider.GetStocks();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final varientpriceController = TextEditingController();

  final quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: seller.variation.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Stack(children: <Widget>[
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Variant: ",
                                    style: kkTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      seller.variation[index].type.toString()),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Variant Price: ",
                                    style: kkTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      seller.variation[index].price.toString()),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "SKU: ",
                                    style: kkTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      seller.variation[index].sku.toString()),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Quantity: ",
                                    style: kkTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      seller.variation[index].qty.toString()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 0,
                          left: 300,
                          child: CircleAvatar(
                              backgroundColor: Colors.red,
                              child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Edit"),
                                            content: Container(
                                              child: Form(
                                                key: _formkey,
                                                child: Column(
                                                  children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  "Variant: ",
                                                                  style:
                                                                      kkTextStyle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(seller
                                                                    .variation[
                                                                        index]
                                                                    .type
                                                                    .toString()),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  "Variant Price: ",
                                                                  style:
                                                                      kkTextStyle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                //     initialValue: seller
                                                                // .variation[
                                                                //     index]
                                                                // .price!
                                                                // .toString(),

                                                                controller:
                                                                    TextEditingController(
                                                                        text:
                                                                           seller
                                                                .variation[
                                                                    index]
                                                                .price!
                                                                .toString(),),
                                                              )),
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  "SKU: ",
                                                                  style:
                                                                      kkTextStyle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(seller
                                                                    .variation[
                                                                        index]
                                                                    .sku
                                                                    .toString()),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  "Quantity: ",
                                                                  style:
                                                                      kkTextStyle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                controller:
                                                                    TextEditingController(text: seller.variation[index].qty.toString()),
                                                                // initialValue:
                                                                //     "hello",
                                                              )),
                                                            ],
                                                          ),
                                                        ]),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancel"),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      seller.variation[index]
                                                              .qty =
                                                          int.parse(
                                                              quantityController
                                                                  .text);
                                                      seller.variation[index]
                                                              .price =
                                                          double.parse(
                                                              varientpriceController
                                                                  .text);
                                                    });
                                                  },
                                                  child: Text("Save changes"))
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.edit))))
                    ]),
                  ));
                }),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Toatal Quantity: ",
                    style: kkTextStyle,
                  ),
                ),
                Expanded(
                  child: Text(seller.minQty.toString()),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Available Pincodes: ",
                    style: kkTextStyle,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: "45667",
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
