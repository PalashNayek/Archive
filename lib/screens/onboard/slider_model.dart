class SliderModel{
  String? image;
  String? header;
  String? description;
  SliderModel({this.image});
  void setImage(String getImage){
    image = getImage;
  }

// getter for image
  String getImage(){
    return image!;
  }
  void setHeader(String getHeader){
    header = getHeader;
  }

  String getDescription(){
    return description!;
  }
  void setDescription(String getDescription){
    description = getDescription;
  }

// getter for image
  String getHeader(){
    return header!;
  }
}
List<SliderModel> getSlides(){
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel1 = new SliderModel();
  SliderModel sliderModel2 = new SliderModel();
  SliderModel sliderModel3 = new SliderModel();
  sliderModel1.setHeader("Right Content to Right Person");
  sliderModel1.setDescription("Introducing for the first time ever in India a sport-media App");
  sliderModel1.setImage("assets/page-1/images/onboarding1.png");
  slides.add(sliderModel1);

  sliderModel2 = new SliderModel();

  // 2
  sliderModel2.setHeader("Latest Sport Update from Local to Global");
  sliderModel2.setDescription("Enjoy the Latest Feed From Local Sports to Global News & Posts");
  sliderModel2.setImage("assets/page-1/images/onboarding2.png");
  slides.add(sliderModel2);

  sliderModel3 = new SliderModel();

  // 3

  sliderModel3.setHeader("Get Fame with Game meet our Coach");
  sliderModel3.setDescription("From vanity of Sports and Specialist,Connect & Enjoy there Experience");
  sliderModel3.setImage("assets/page-1/images/onboarding3.png");
  slides.add(sliderModel3);
  return slides;
}