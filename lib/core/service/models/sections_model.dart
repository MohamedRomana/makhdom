class SectionsModel {
  late final int id;
  late final String title;

  SectionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}

class CitiesModel {
  late final int id;
  late final String title;

  CitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}

class DepartmentViewModel {
  late final int id;
  late final String title;

  DepartmentViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}

class DepartmenFinishTypesModel {
  late final int id;
  late final String title;

  DepartmenFinishTypesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}

class DepartmenSectionsModel {
  late final int id;
  late final String title;

  DepartmenSectionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}