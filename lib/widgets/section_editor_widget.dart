import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/models/product_model.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/widgets/product_editor_widget.dart';

class SectionEditorWidget extends StatelessWidget {
  final SectionModel section;
  final Function(SectionModel) onChange;
  const SectionEditorWidget({
    Key? key,
    required this.section,
    required this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SectionModel _section = section;
    List<ProductModel> _products = section.products;
    String _sectionName = section.sectionName;
    String _cover = section.cover;

    void newSection() {
      _section = _section.copyWith(
        sectionName: _sectionName,
        cover: _cover,
        products: _products
      );
    }

    return Column(
      children: [
        Text(section.sectionName),
        ...List.generate(_products.length, (index) {
          return ProductEditorWidget(
            product: _products[index],
            onChange: (ProductModel newProduct) {
              _products[index] = newProduct;
              newSection();
              onChange(_section);
            }
          );
        })
      ],
    );
  }
}
