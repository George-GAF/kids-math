class AppSize {
  AppSize._();
  static final AppSize _instance = AppSize._();
  factory AppSize() {
    return _instance;
  }

  late double _height;
  late double _width;

  double getHeight() {
    return _height;
  }

  double getWidth() {
    return _width;
  }

  void readScreenSize(double height, double width) {
    _height = height;
    _width = width;
  }
}
