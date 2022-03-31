import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/models/product_model.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/widgets/elevated_button_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/product_editor_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/section_header_editor_widget.dart';

class SectionEditorWidget extends StatefulWidget {
  final SectionModel section;
  final Function(SectionModel) onChange;
  const SectionEditorWidget({
    Key? key,
    required this.section,
    required this.onChange
  }) : super(key: key);

  @override
  State<SectionEditorWidget> createState() => _SectionEditorWidgetState();
}

class _SectionEditorWidgetState extends State<SectionEditorWidget> {
  @override
  Widget build(BuildContext context) {

    SectionModel _section = widget.section;
    List<ProductModel> _products = widget.section.products;
    String _sectionName = widget.section.sectionName;
    String _cover = widget.section.cover;

    void createNewSection() {
      _section = _section.copyWith(
        sectionName: _sectionName,
        cover: _cover,
        products: _products
      );
      widget.onChange(_section);
    }

    return Column(
      children: [
        SectionHeaderEditorWidget(
          section: widget.section,
          onChange: (String newSectionName) {
            _sectionName = newSectionName;
            createNewSection();
          }
        ),
        ...List.generate(_products.length, (index) {
          return ProductEditorWidget(
            product: _products[index],
            onChange: (ProductModel newProduct) {
              _products[index] = newProduct;
              createNewSection();
            }
          );
        }),
        ElevatedButtonWidget(
          text: "ADD",
          onTap: () {
            setState(() {
              _products.add(const ProductModel(productName: "", price: ""));
              createNewSection();
            });
          },
        )
      ],
    );
  }
}
