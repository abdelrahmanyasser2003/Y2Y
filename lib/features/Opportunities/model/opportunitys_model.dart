import 'dart:convert';
import 'dart:typed_data'; // لإضافة support لـ base64Decode

class OpportunityDetilsModel {
  String opportunitytitledetils;
  String companymodeldetils;
  String requirementsmodeldetils;
  String descriptionmodeldetils;
  String responsibilitiesmodeldetils;
  String durationmodeldetils;
  String applicationdeadlinemodeldetils;
  String caregory;
  Uint8List imagepath;

  OpportunityDetilsModel({
    required this.opportunitytitledetils,
    required this.companymodeldetils,
    required this.requirementsmodeldetils,
    required this.descriptionmodeldetils,
    required this.responsibilitiesmodeldetils,
    required this.durationmodeldetils,
    required this.caregory,
    required this.imagepath,
    required this.applicationdeadlinemodeldetils,
  });

  // دالة لتحويل JSON إلى كائن من النوع OpportunityDetilsModel
  factory OpportunityDetilsModel.fromJson(Map<String, dynamic> json) {
    return OpportunityDetilsModel(
      opportunitytitledetils: json['opportunitytitledetils'] ?? '',
      companymodeldetils: json['companymodeldetils'] ?? '',
      requirementsmodeldetils: json['requirementsmodeldetils'] ?? '',
      descriptionmodeldetils: json['descriptionmodeldetils'] ?? '',
      responsibilitiesmodeldetils: json['responsibilitiesmodeldetils'] ?? '',
      durationmodeldetils: json['durationmodeldetils'] ?? '',
      caregory: json['caregory'] ?? '',
      imagepath: _convertToUint8List(json['imagepath']), // تحويل الصورة إلى Uint8List
      applicationdeadlinemodeldetils: json['applicationdeadlinemodeldetils'] ?? '',
    );
  }

  // دالة لتحويل الصورة إلى Uint8List من نوع Base64
  static Uint8List _convertToUint8List(dynamic imageData) {
    if (imageData != null && imageData is String) {
      // إذا كانت الصورة على شكل Base64 string
      try {
        return base64Decode(imageData); // استخدام base64Decode لتحويل Base64 إلى Uint8List
      } catch (e) {
        print("Error decoding base64: $e");
      }
    }
    return Uint8List(0); // إذا لم تكن الصورة متاحة أو غير صحيحة
  }
}
