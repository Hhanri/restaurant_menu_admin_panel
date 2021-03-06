import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/resources/strings.dart';
import 'package:restaurant_menu_back_panel/services/firebase_service.dart';
import 'package:restaurant_menu_back_panel/widgets/padding_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/restaurant_menu_widgets/cover_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_field_widget.dart';
import 'package:restaurant_menu_back_panel/widgets/text_with_text_field_widget.dart';

class SectionHeaderEditorWidget extends StatelessWidget {
  final SectionModel section;
  final Function(String) onNameChange;
  final Function(String) onCoverChange;
  const SectionHeaderEditorWidget({
    Key? key,
    required this.section,
    required this.onNameChange,
    required this.onCoverChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PaddingWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: TextWithTextFieldWidget(
              parameters: NormalTextFieldParameters(),
              text: TitleStrings.sectionTitle,
              value: section.sectionName,
              onChange: (value) {
                onNameChange(value);
              },
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: FirebaseServices().downloadURL(section.cover),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                  return CoverWidget(
                    cover: snapshot.data,
                    onCoverUpdate: (String image) {
                      onCoverChange(image);
                    },
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
