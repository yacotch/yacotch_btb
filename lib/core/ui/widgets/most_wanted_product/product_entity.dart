class ProductEntity {
  int? id;
  String? name;
  int? numOfOrders, price;
  List<String>? images;
  ProductEntity(
      {this.images, this.id, this.name, this.numOfOrders, this.price});
}
