import 'package:get/get.dart';

class FormController extends GetxController {
  final formData = <String, dynamic>{
    'firstName': '',
    'lastName': '',
    'phoneNumber': '',
    'contactEmail': '',
    'summary': '',
    'city': '',
    'awards': [],
    'qualifications': [],
    'projects': [],
    'experiences': [],
  }.obs;

  void addAward(Map<String, dynamic> award) {
    formData['awards'].add(award);
    update();
  }

  void addQualification(Map<String, dynamic> qualification) {
    formData['qualifications'].add(qualification);
    update();
  }

  void addProject(Map<String, dynamic> project) {
    formData['projects'].add(project);
    update();
  }

  void addExperience(Map<String, dynamic> experience) {
    formData['experiences'].add(experience);
    update();
  }
  void updateFormData(Map<String, dynamic> newData) {
    formData.addAll(newData);
    update();
  }
}
