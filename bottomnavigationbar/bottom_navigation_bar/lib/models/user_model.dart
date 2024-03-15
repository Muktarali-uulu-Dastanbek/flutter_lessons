class UserModel {
  final String name;
  final String surname;
  final String? patronymic; //отчество
  final String jobTitle; //должность
  final String phoneNumber;
  final String imageUrl;

  UserModel({
    required this.name,
    required this.surname,
    this.patronymic,
    required this.jobTitle,
    required this.phoneNumber,
    required this.imageUrl,
  }); //аватарка пользователя
}

List<UserModel> usersList = [
  UserModel(
    name: "name1",
    surname: "surname1",
    jobTitle: "jobTitle1",
    phoneNumber: "11111",
    imageUrl: "assets/images/avatar1.png",
  ),
  UserModel(
    name: "name2",
    surname: "surname2",
    patronymic: "patronymic2",
    jobTitle: "jobTitle2",
    phoneNumber: "22222",
    imageUrl: "assets/images/avatar2.png",
  ),
  UserModel(
    name: "name3",
    surname: "surname3",
    jobTitle: "jobTitle3",
    phoneNumber: "33333",
    imageUrl: "assets/images/avatar3.png",
  ),
];
