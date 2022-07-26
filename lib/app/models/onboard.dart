class OnboardModel {
  String? title;
  String? imagePath;

  OnboardModel({this.imagePath, this.title});
}

List<OnboardModel> onboardList = [
  OnboardModel(
    title: 'Never worry about\ntaking out trash again',
    imagePath: 'assets/images/onboard1.png',
  ),
  OnboardModel(
    title: 'Schedule Pickups at\nyour convenience',
    imagePath: 'assets/images/onboard2.png',
  ),
  OnboardModel(
    title: 'Do your part by\nsaving the world',
    imagePath: 'assets/images/onboard3.png',
  ),
];
