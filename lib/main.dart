import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/models/product_model.dart';
import 'package:restaurant_menu_back_panel/widgets/product_editor_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductModel test = const ProductModel(productName: "haha", price: "12");

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ProductEditorWidget(
              product: test,
              onChange: (newProduct) {
                test = newProduct;
                print(test);
              },
            )
          )
        ],
      ),
    );
  }
}