import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/models/product_model.dart';
import 'package:restaurant_menu_back_panel/widgets/text_field_widget.dart';

class ProductEditorWidget extends StatelessWidget {
  final ProductModel product;
  final Function(ProductModel) onChange;
  const ProductEditorWidget({
    Key? key,
    required this.product,
    required this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String productName = product.productName;
    String productPrice = product.price;

    void createNewProduct() {
      final newProduct = ProductModel(productName: productName, price: productPrice);
      onChange(newProduct);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: textWithTextFieldWidget(
            text: "name",
            value: productName,
            onChange: (value) {
              productName = value;
              createNewProduct();
            },
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: textWithTextFieldWidget(
            text: "price",
            value: productPrice,
            onChange: (value) {
              productPrice = value;
              createNewProduct();
            },
          ),
        ),
      ],
    );
  }

  Widget textWithTextFieldWidget({required String text, required String value, required Function(String) onChange}) {
    return Row(
      children: [
        textWidget(text: text),
        Expanded(
          child: TextFieldWidget(
            onChange: (value) {
              onChange(value);
            },
            value: value
          ),
        )
      ],
    );
  }

  Widget textWidget({required String text}) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text
        ),
      ),
    );
  }
}
