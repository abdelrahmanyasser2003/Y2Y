
import 'dart:typed_data';

class opportunitydetilsmodel {
  String opportunitytitledetils;
  String companymodeldetils;
  String requirementsmodeldetils;
  String descriptionmodeldetils;
  String responsibilitiesmodeldetils;
  String durationmodeldetils;
  String applicationdeadlinemodeldetils;
  String caregory;
  Uint8List imagepath;
  opportunitydetilsmodel(
      {required this.opportunitytitledetils,
      required this.companymodeldetils,
      required this.requirementsmodeldetils,
      required this.descriptionmodeldetils,
      required this.responsibilitiesmodeldetils,
      required this.durationmodeldetils,
      required this.caregory,
      required this.imagepath,
      required this.applicationdeadlinemodeldetils});
}
