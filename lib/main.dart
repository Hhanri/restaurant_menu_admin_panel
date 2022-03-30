import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/models/product_model.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/product_editor_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/restaurant_menu_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/section_editor_widget.dart';

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

    ProductModel test1 = const ProductModel(productName: "haha", price: "12");
    ProductModel test2 = const ProductModel(productName: "hehe", price: "13");
    ProductModel test3 = const ProductModel(productName: "hihi", price: "142");

    SectionModel section1 = SectionModel(
        sectionName: "Section1",
        products: [test1,test2,test3],
        cover: "no cover"
    );

    SectionModel section2 = SectionModel(
        sectionName: "Section2",
        products: [test2,test3,test1],
        cover: "yes cover"
    );

    List<SectionModel> sections = [section1,section2];

    return RestaurantMenuWidget(
      sections: sections,
      onChange: (List<SectionModel> newSections) {
        sections = newSections;
        print(sections);
      },
    );
  }
}