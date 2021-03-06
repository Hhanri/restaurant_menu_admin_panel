import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_menu_back_panel/models/section_model.dart';
import 'package:restaurant_menu_back_panel/resources/app_constants.dart';

class FirebaseServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<List<SectionModel>> loadMenuFromFirebase() async {
    //_firebaseFirestore.settings = const Settings(persistenceEnabled: false);
    final DocumentSnapshot<Map<String, dynamic>> response = await _firebaseFirestore.collection(AppConstants.restaurantMenu).doc(AppConstants.restaurantMenu).snapshots().first;
    final Map<String, dynamic> data = response.data()!;
    final List<SectionModel> treatedData = await SectionModel.listFromJson(data: data[AppConstants.restaurantMenu], fromFirebase: false);
    return treatedData;
  }

  Future<void> loadMenuToFirebase(List<SectionModel> sections) async {
    //_firebaseFirestore.settings = const Settings(persistenceEnabled: false);
    final Map<String, dynamic> map = {AppConstants.restaurantMenu : SectionModel.listToJson(sections)};
    _firebaseFirestore
        .collection(AppConstants.restaurantMenu)
        .doc(AppConstants.restaurantMenu)
        .set(map);
  }

  Future<Map<String, dynamic>> loadConfigFromFirebase() async{
    final DocumentSnapshot<Map<String, dynamic>> response = await _firebaseFirestore.collection(AppConstants.config).doc(AppConstants.config).snapshots().first;
    final Map<String, dynamic> data = response.data()!;
    return data;
  }

  Future<void> loadConfigToFirebase(Map<String, dynamic> config) async {
    await _firebaseFirestore
        .collection(AppConstants.config)
        .doc(AppConstants.config)
        .set({AppConstants.config : config});
  }
/*
  void loadMenuToFirebase() async {
    _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
    final String response = await rootBundle.loadString('assets/restaurant_menu.json');
    final data = await json.decode(response);
    _firebaseFirestore.collection(AppConstants.restaurantMenu).doc(AppConstants.restaurantMenu).set(data);
  }

  void loadConfigToFirebase() async {
    _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
    final String response = await rootBundle.loadString('assets/config.json');
    final data = await json.decode(response);
    _firebaseFirestore.collection(AppConstants.config).doc(AppConstants.config).set(data);
  }
 */
  Future<void> uploadImage(XFile image) async {
    final String path = "assets/images/${image.name}";
    final Reference ref = _firebaseStorage.ref().child(path);
    await ref.putData(await image.readAsBytes(), SettableMetadata(contentType: "image/jpeg"));
  }


  Future<String> downloadURL(String imagePath) async {
    String downloadURL = await _firebaseStorage.ref(imagePath).getDownloadURL();
    return downloadURL;
  }
}