import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/resources/strings.dart';
import 'package:restaurant_menu_back_panel/widgets/elevated_button_widget.dart';

class SectionEditorRowButtonsWidget extends StatelessWidget {
  final VoidCallback onAddProduct;
  final VoidCallback onDeleteSection;
  const SectionEditorRowButtonsWidget({
    Key? key,
    required this.onAddProduct,
    required this.onDeleteSection
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedIconButtonWidget(
          text: TitleStrings.addProcut,
          onTap: onAddProduct,
          icon: Icons.add,
        ),
        ElevatedIconButtonWidget(
          text: TitleStrings.removeSection,
          onTap: onDeleteSection,
          icon: Icons.delete
        )
      ]
    );
  }
}
