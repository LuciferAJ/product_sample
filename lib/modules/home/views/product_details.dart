import 'package:flutter/material.dart';
import 'package:product_sample/modules/home/models/product_model.dart';
import 'package:product_sample/modules/home/repo/homepage_repo.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  ProductDetails({required this.product});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Product product;
  @override
  void initState() {
    product = widget.product;
    super.initState();
  }

  Future<bool> handleBack() async {
    Navigator.pop(context, product);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => handleBack(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, product);
              },
              icon: Icon(Icons.arrow_left)),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${product.productName}"),
              Text("${product.productBrand}"),
              Text("${product.price}"),
              TextButton(
                  onPressed: () {
                    updateProduct();
                  },
                  child: const Text("Update Price"))
            ],
          ),
        ),
      ),
    );
  }

  void updateProduct() async {
    if (product.id != null) {
      product = await HomepageRepo.updateProduct(product.id!);
      setState(() {});
    }
  }
}
