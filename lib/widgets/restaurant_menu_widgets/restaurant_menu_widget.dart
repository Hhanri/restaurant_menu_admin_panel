import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu_back_panel/blocs/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/resources/strings.dart';
import 'package:restaurant_menu_back_panel/widgets/divider_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/elevated_button_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/section_editor_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/title_widget.dart';

class RestaurantMenuWidget extends StatelessWidget {
  final List<SectionModel> sections;
  final VoidCallback onUpdate;
  const RestaurantMenuWidget({
    Key? key,
    required this.sections,
    required this.onUpdate
  }) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<SectionModel> _sections = sections;
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleWidget(text: TitleStrings.menu),
            ...List.generate(
              _sections.length,
              (index) {
                return Column(
                  children: [
                    SectionEditorWidget(
                      sectionIndex: index,
                      section: _sections[index],
                      reloadFromFirebase: onUpdate,
                    ),
                    const DividerWidget()
                  ],
                );
              }
            ),
            ElevatedIconButtonWidget(
              onTap: () {
                BlocProvider.of<RestaurantMenuBloc>(context).add(AddSectionEvent());
              },
              text: TitleStrings.addSection,
              icon: Icons.add
            ),
            ElevatedIconButtonWidget(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  onUpdate();
                }
              },
              text: TitleStrings.update,
              icon: Icons.upload
            ),
          ],
        ),
      ),
    );
  }
}
