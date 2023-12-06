class OnBoardModel {
  final String title;
  final String description;
  final String imageName;

  OnBoardModel({required this.title, required this.description, required this.imageName});

  String get imageWithPath => 'asset/images/$imageName.png';
}

class OnBoardModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel(
        title: "Order your Food",
        description: "Now you can order food any time right from your mobile. ",
        imageName: "ic_chef"),
    OnBoardModel(
        title: "Order your Food",
        description: "Now you can order food any time right from your mobile. ",
        imageName: "ic_delivery"),
    OnBoardModel(
        title: "Order your Food",
        description: "Now you can order food any time right from your mobile. ",
        imageName: "ic_order"),
  ];
}
