import 'package:flutter/material.dart';
import 'package:product_sample/modules/home/models/product_model.dart';
import 'package:product_sample/modules/home/repo/homepage_repo.dart';
import 'package:product_sample/modules/home/widgets/display_item.dart';

class DisplayHomePage extends StatefulWidget {
  const DisplayHomePage({Key? key}) : super(key: key);

  @override
  _DisplayHomePageState createState() => _DisplayHomePageState();
}

class _DisplayHomePageState extends State<DisplayHomePage> {
  List<Product> productList = [];
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  void getProducts() async {
    productList = await HomepageRepo.getHomePageList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: productList.length,
            itemBuilder: (context, int index) {
              Product product = productList[index];
              return DisplayItem(product: product);
            }),
      ),
    );
  }
}
