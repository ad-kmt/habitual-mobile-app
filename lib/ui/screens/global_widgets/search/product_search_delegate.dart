import 'package:flutter/material.dart';
import 'package:habitual/data/provider/product_api.dart';

class ProductSearchDelegate extends SearchDelegate {
  ProductApiClient productApiClient = ProductApiClient();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Icon(Icons.search);
  }

  @override
  Widget buildResults(BuildContext context) {
    // return FutureBuilder<List<ProductModel>>(
    //     future: productApiClient.searchProducts(query),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
    //       Widget widget;
    //       if (snapshot.hasData) {
    //         List<ProductModel> products = snapshot.data!;
    //         widget = Expanded(
    //           child: ListView.builder(
    //             itemCount: products.length,
    //             itemBuilder: (context, index) => SearchResultCard(
    //               product: products[index],
    //             ),
    //           ),
    //         );
    //       } else {
    //         widget = Text("No Results");
    //       }
    //       return Column(
    //         children: [widget],
    //       );
    //     });

    return Column(
      children: [
        Text("No Results"),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return FutureBuilder<List<ProductModel>>(
    //     future: productApiClient.searchProducts(query),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
    //       Widget widget;
    //       if (snapshot.hasData) {
    //         List<ProductModel> products = snapshot.data!;
    //         widget = Expanded(
    //           child: ListView.builder(
    //             itemCount: products.length,
    //             itemBuilder: (context, index) => SearchResultCard(
    //               product: products[index],
    //             ),
    //           ),
    //         );
    //       } else {
    //         widget = Text("No Results");
    //       }
    //       return Column(
    //         children: [widget],
    //       );
    //     });

    return Column(
      children: [
        Text("No Results"),
      ],
    );
  }
}
