class SliderModel {
  String? image, title, description;

  //constructor for variables
  SliderModel({this.title, this.description, this.image});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImage() {
    return image.toString();
  }

  String getTitle() {
    return title.toString();
  }

  String getDescription() {
    return description.toString();
  }
}

//List created
List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

  //item 1
  sliderModel.setImage("assets/images/social-media.png");
  sliderModel.setTitle("Welcome to Maasai  Marketing App");
  sliderModel.setDescription(
      "You can sell and buy animals and animal products without any hustle");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  sliderModel.setImage("assets/images/payment-method.png");
  sliderModel.setTitle("Payment and Tracking");
  sliderModel.setDescription(
      "Get your payments instantly and track your order in real-time.");
  slides.add(sliderModel);

  sliderModel = SliderModel();
  return slides;
}
