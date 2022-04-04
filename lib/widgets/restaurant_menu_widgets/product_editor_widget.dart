import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:restaurant_menu_back_panel/models/product_model.dart';
import 'package:restaurant_menu_back_panel/resources/strings.dart';
import 'package:restaurant_menu_back_panel/widgets/icon_button_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_field_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_with_text_field_widget.dart';

class ProductEditorWidget extends StatelessWidget {
  final ProductModel product;
  final int productIndex;
  final int sectionIndex;
  const ProductEditorWidget({
    Key? key,
    required this.product,
    required this.productIndex,
    required this.sectionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String productName = product.productName;
    String productPrice = product.price;

    void createNewProduct() {
      final newProduct = ProductModel(productName: productName, price: productPrice);
      BlocProvider.of<RestaurantMenuBloc>(context).add(EditProductEvent(newProduct: newProduct, sectionIndex: sectionIndex, productIndex: productIndex));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 10,
          child: TextWithTextFieldWidget(
            parameters: NormalTextFieldParameters(),
            text: TitleStrings.name,
            value: productName,
            onChange: (value) {
              productName = value;
              createNewProduct();
            },
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 8,
          child: TextWithTextFieldWidget(
            parameters: PriceTextFieldParameters(),
            text: TitleStrings.price,
            value: productPrice,
            onChange: (value) {
              productPrice = value;
              createNewProduct();
            },
          ),
        ),
        const Spacer(flex: 1),
        IconButtonWidget(
          onPress: (){
            BlocProvider.of<RestaurantMenuBloc>(context).add(RemoveProductEvent(sectionIndex: sectionIndex, productIndex: productIndex));
          },
          icon: Icons.delete_forever
        )
      ],
    );
  }
}
