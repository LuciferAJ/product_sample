import 'package:flutter/material.dart';
import 'package:product_sample/modules/home/data/static_product_data.dart';
import 'package:product_sample/modules/home/models/product_model.dart';
import 'package:product_sample/modules/home/views/product_details.dart';

class DisplayItem extends StatefulWidget {
  final Product product;
  const DisplayItem({required this.product});

  @override
  State<DisplayItem> createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListTile(
          leading: Text("${widget.product.id}"),
          title: Text(
              "${widget.product.productBrand} - ${widget.product.productName}"),
          subtitle: Text("Price ${widget.product.price}"),
          trailing: TextButton(
            onPressed: () async {
              await navigateToProductDetails();
            },
            child: const Text("Details"),
          ),
        ));
  }

  Future<void> navigateToProductDetails() async {
    final Product updatedProduct = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => ProductDetails(product: widget.product)));
    final productIndex =
        productList.indexWhere((element) => element.id == updatedProduct.id);
    productList[productIndex] = updatedProduct;
    setState(() {});
  }
}
