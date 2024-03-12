class OnboardingContent {
  String image;
  String description;

  OnboardingContent({required this.image, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: 'images/hand-drawn-iranian-women.avif',
      description: "Consult only with a doctor you trust"),
  OnboardingContent(
      image: 'images/doctor1.jpg',
      description: "Consult only with a doctor you trust"),
  OnboardingContent(
      image: 'images/images.png',
      description: "Consult only with a doctor you trust"),
];
