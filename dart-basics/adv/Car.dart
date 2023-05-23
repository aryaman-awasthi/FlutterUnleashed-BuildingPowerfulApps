class Car {
  late String _color;

  set setColor(String color) {
    this._color = color;
  }

  String get color => this._color;

  void carColor() {
    print('Car is ${this._color}');
  }
}
