class OnboardingModel {
  final int index;
  final String title;
  final String description;
  final String image;
  bool? isActive;

  OnboardingModel({
    required this.index,
    required this.title,
    required this.description,
    required this.image,
    this.isActive,
  });
}
