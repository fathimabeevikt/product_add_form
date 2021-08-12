import 'package:flutter/material.dart';
import 'package:productaddingform/model/seller_info.dart';
import 'package:productaddingform/provider/stokeprovider.dart';
import 'package:productaddingform/variants.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var seller = StocksProvider.GetStocks();
  bool _detailedForm = false;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  var selectedDiscountType = 'Percent';
  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                 DropdownButtonFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                    hintText:"Eg. Lux"),
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return  DropdownMenuItem<String>(
                        value: value,
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(value),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _detailedForm = true;
                                    });
                                  },
                                  child: Text("Choose"))
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  _detailedForm
                      ? Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    child: Image.network(
                                        seller.shopImage.toString()),
                                  ),
                                  Text(seller.shopName.toString())
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: TextEditingController(text: seller.unitPrice.toString()),
                                  decoration: InputDecoration(
                                      labelText: "Unit price",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black12)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black12))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: TextEditingController(text: seller.unitPrice.toString()),
                                  decoration: InputDecoration(
                                      labelText: "Purchase price",
                                      
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black12)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black12))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: TextEditingController(text: seller.tax.toString()),
                                  decoration: InputDecoration(
                                      labelText: "Tax Percent ( % )",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black12)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black12))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: TextEditingController(text: seller.discount.toString()),
                                  decoration: InputDecoration(
                                      labelText: "Discount",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black12)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black12))),
                                ),
                              ),
                              DropdownButton<String>(
                                value: selectedDiscountType,
                                //hint: Text("Select Discount"),
                                onChanged: (value) {
                                  setState(() {
                                    selectedDiscountType = value!;
                                  });
                                },
                                items: <String>["Percent", "Flat"]
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(
                                      value,
                                    ),
                                  );
                                }).toList(),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Variants(),
                                        ));
                                  },
                                  child: Text("Next"))
                            ],
                          ),
                        )
                      : Container(),
                ],
              )),
        ),
      ),
    );
  }
}
// TextFormField(
//                       controller: vehiclennoController,
//                       decoration: InputDecoration(
//                         labelText: "Vehicle Number",
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: kcolorash),
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: kcolorash),
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Enter Vehicle Number';
//                         }
//                         return null;
//                       },
//                     ),