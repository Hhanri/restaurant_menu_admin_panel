import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:restaurant_menu_back_panel/models/product_model.dart';
import 'package:restaurant_menu_back_panel/widgets/padding_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_with_text_field_widget.dart';

class ProductEditorWidget extends StatelessWidget {
  final ProductModel product;
  final int productIndex;
  final int sectionIndex;
  const ProductEditorWidget({
    Key? key,
    required this.product,
    required this.productIndex,
    required this.sectionIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String productName = product.productName;
    String productPrice = product.price;

    void createNewProduct() {
      final newProduct = ProductModel(productName: productName, price: productPrice);
      BlocProvider.of<RestaurantMenuBloc>(context).add(EditProductEvent(newProduct: newProduct, sectionIndex: sectionIndex, productIndex: productIndex));
    }

    return PaddingWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: TextWithTextFieldWidget(
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
            child: TextWithTextFieldWidget(
              text: "price",
              value: productPrice,
              onChange: (value) {
                productPrice = value;
                createNewProduct();
              },
            ),
          ),
        ],
      ),
    );
  }
}
