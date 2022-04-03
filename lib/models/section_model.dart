import 'package:equatable/equatable.dart' show Equatable;
import 'package:restaurant_menu_back_panel/models/product_model.dart' show ProductModel;
import 'package:restaurant_menu_back_panel/resources/app_constants.dart';

class SectionModel extends Equatable{
  final String sectionName;
  final List<ProductModel> products;
  final String cover;

  const SectionModel({
    required this.sectionName,
    required this.products,
    required this.cover
  });

  SectionModel copyWith({String? sectionName, List<ProductModel>? products, String? cover}) {
    return SectionModel(
      sectionName: sectionName ?? this.sectionName,
      products: products ?? this.products,
      cover: cover ?? this.cover
    );
  }

  static Future<SectionModel> fromJson({required Map<String, dynamic> data, required bool fromFirebase}) async {
    return SectionModel(
      sectionName: data[AppConstants.sectionName],
      products: List<ProductModel>.from(data[AppConstants.products].map((jsonProduct) => ProductModel.fromJson(jsonProduct))),
      cover: data[AppConstants.cover]
    );
  }

  static Map<String, dynamic> toJson(SectionModel model) {
    return {
      AppConstants.sectionName : model.sectionName,
      AppConstants.products : List<Map<String, dynamic>>.from(model.products.map((product) => ProductModel.toJson(product))),
      AppConstants.cover : model.cover
    };
  }

  static Future<List<SectionModel>> listFromJson({required List<dynamic> data, required bool fromFirebase}) async {
    List<SectionModel> result = [];
    for (var element in data) {
      result.add(await fromJson(data: element, fromFirebase: fromFirebase));
    }
    return result;
  }

  static List<Map<String, dynamic>> listToJson(List<SectionModel> listModel) {
    return List<Map<String, dynamic>>.from(listModel.map((section) => toJson(section)));
  }

  static SectionModel defaultSectionModel = SectionModel(
    sectionName: AppConstants.sectionName,
    products: [],
    cover: "assets/images/white-thumbnail.jpg"
  );

  @override
  // TODO: implement props
  List<Object?> get props => [sectionName, products, cover];
}