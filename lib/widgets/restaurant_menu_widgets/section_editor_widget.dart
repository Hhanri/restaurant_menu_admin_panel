import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/widgets/padding_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/product_editor_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/section_editor_row_buttons_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/section_header_editor_widget.dart';

class SectionEditorWidget extends StatefulWidget {
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
  State<SectionEditorWidget> createState() => _SectionEditorWidgetState();
}

class _SectionEditorWidgetState extends State<SectionEditorWidget> {
  @override
  Widget build(BuildContext context) {

    return PaddingWidget(
      child: Column(
        children: [
          SectionHeaderEditorWidget(
            section: widget.section,
            onNameChange: (String newSectionName) {
              BlocProvider.of<RestaurantMenuBloc>(context).add(EditSectionName(newName: newSectionName, sectionIndex: widget.sectionIndex));
            },
            onCoverChange: (String newCover) {
              widget.reloadFromFirebase();
            },
          ),
          ...List.generate(widget.section.products.length, (index) {
            return ProductEditorWidget(
              key: UniqueKey(),
              sectionIndex: widget.sectionIndex,
              productIndex: index,
              product: widget.section.products[index],
            );
          }),
          SectionEditorRowButtonsWidget(
            onAddProduct: () {
              BlocProvider.of<RestaurantMenuBloc>(context).add(AddProductEvent(sectionIndex: widget.sectionIndex));
            },
            onDeleteSection: () {
              BlocProvider.of<RestaurantMenuBloc>(context).add(RemoveSectionEvent(sectionIndex: widget.sectionIndex));
            },
          )
        ],
      ),
    );
  }
}
