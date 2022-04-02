import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/widgets/elevated_button_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/product_editor_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/section_editor_row_buttons_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/section_header_editor_widget.dart';

class SectionEditorWidget extends StatelessWidget {
  final SectionModel section;
  final int sectionIndex;
  final VoidCallback reloadFromFirebase;
  const SectionEditorWidget({
    Key? key,
    required this.section,
    required this.reloadFromFirebase,
    required this.sectionIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SectionHeaderEditorWidget(
          section: section,
          onNameChange: (String newSectionName) {
            BlocProvider.of<RestaurantMenuBloc>(context).add(EditSectionName(newName: newSectionName, sectionIndex: sectionIndex));
          },
          onCoverChange: (String newCover) {
            reloadFromFirebase();
          },
        ),
        ...List.generate(section.products.length, (index) {
          return ProductEditorWidget(
            key: UniqueKey(),
            sectionIndex: sectionIndex,
            productIndex: index,
            product: section.products[index],
          );
        }),
        SectionEditorRowButtonsWidget(
          onAddProduct: () {
            BlocProvider.of<RestaurantMenuBloc>(context).add(AddProductEvent(sectionIndex: sectionIndex));
          },
          onDeleteSection: () {
            BlocProvider.of<RestaurantMenuBloc>(context).add(RemoveSectionEvent(sectionIndex: sectionIndex));
          },
        )
      ],
    );
  }
}
