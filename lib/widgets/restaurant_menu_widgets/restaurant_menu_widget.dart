import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/section_editor_widget.dart';

class RestaurantMenuWidget extends StatelessWidget {
  final List<SectionModel> sections;
  final Function(List<SectionModel>) onChange;
  final VoidCallback onUpdate;
  const RestaurantMenuWidget({
    Key? key,
    required this.sections,
    required this.onChange,
    required this.onUpdate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SectionModel> _sections = sections;
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            _sections.length,
            (index) {
              return Column(
                children: [
                  SectionEditorWidget(
                    section: _sections[index],
                    onChange: (SectionModel newSection) {
                      _sections[index] = newSection;
                      onChange(_sections);
                    }
                  ),
                  buildDivider()
                ],
              );
            }
          ),
          ElevatedButton(
            onPressed: onUpdate,
            child: Text("UPDATE")
          )
        ],
      ),
    );
  }

  Widget buildDivider() {
    return const Padding(
      padding:EdgeInsets.all(8.0),
      child: Divider(),
    );
  }
}
