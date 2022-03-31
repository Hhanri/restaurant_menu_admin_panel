import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/services/firebase_service.dart';
import 'package:restaurant_menu_back_panel/widgets/padding_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_with_text_field_widget.dart';

class SectionHeaderEditorWidget extends StatelessWidget {
  final SectionModel section;
  final Function(String) onChange;
  const SectionHeaderEditorWidget({
    Key? key,
    required this.section,
    required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _sectionName = section.sectionName;

    return PaddingWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: TextWithTextFieldWidget(
              text: "Section Title",
              value: _sectionName,
              onChange: (value) {
                _sectionName = value;
                onChange(_sectionName);
              },
            ),
          ),
          const Spacer(flex: 2,),
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: FirebaseServices().downloadURL(section.cover),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                    height: 90,
                    width: 160,
                    child: Image.network(
                      snapshot.data,
                      fit: BoxFit.cover,
                    )
                  );
                }
                return const SizedBox(
                  height: 90,
                  width: 160,
                );
              },

            ),
          )
        ],
      ),
    );
  }
}
