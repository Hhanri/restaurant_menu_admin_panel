import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_menu_back_panel/services/firebase_service.dart';

class CoverWidget extends StatefulWidget {
  final String cover;
  final Function(String) onCoverUpdate;
  const CoverWidget({
    Key? key,
    required this.cover,
    required this.onCoverUpdate
  }) : super(key: key);

  @override
  State<CoverWidget> createState() => _CoverWidgetState();
}

class _CoverWidgetState extends State<CoverWidget> {
  late String _cover;
  bool _visible = false;

  @override
  void initState() {
    _cover = widget.cover;
  }
  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      onEnter: (PointerEnterEvent details) {
        setState(() => _visible = true);
      },
      onExit: (PointerExitEvent details) {
        setState(() => _visible = false);
      },
      child: !_visible
        ? SizedBox(
            height: 90,
            width: 160,
            child: widget.cover.startsWith("https://")
              ? Image.network(
                  _cover,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  _cover,
                  fit: BoxFit.cover,
                )
          )
        : Visibility(
            visible: _visible,
            child: GestureDetector(
              onTap: () async {
                updateCover();
              },
              child: const SizedBox(
                height: 90,
                width: 160,
                child: Icon(Icons.add_a_photo_outlined),
              ),
            )
          )
    );
  }
  void updateCover() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _cover = image.path;
      });
      await FirebaseServices().uploadImage(image);
      widget.onCoverUpdate("assets/images/${image.name}");
    }
  }
}
