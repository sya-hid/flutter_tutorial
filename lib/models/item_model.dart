class ItemModel {
  final String? image, title, subtitle;

  ItemModel({this.image, this.title, this.subtitle});
}

List<ItemModel> dataItem = [
  ItemModel(
      image: 'assets/images/banana.jpg', title: 'Banana', subtitle: 'subtitle'),
  ItemModel(
      image: 'assets/images/fresh-fruits-isolated-white-background.jpg',
      title: 'FreshFruit',
      subtitle: 'subtitle'),
  ItemModel(
      image: 'assets/images/fruits.jpg', title: 'Fruits', subtitle: 'subtitle'),
  ItemModel(
      image: 'assets/images/grape.jpg', title: 'Grape', subtitle: 'subtitle'),
  ItemModel(
      image: 'assets/images/honeydew.jpg',
      title: 'Honeydew',
      subtitle: 'subtitle'),
  ItemModel(
      image: 'assets/images/orange.jpg', title: 'Orange', subtitle: 'subtitle'),
  ItemModel(
      image: 'assets/images/vegetable.jpg',
      title: 'Vegetable',
      subtitle: 'subtitle'),
];
