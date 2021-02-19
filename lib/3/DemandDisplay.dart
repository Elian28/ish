class DemandDisplay {
  static List<Product> productList = [
    Product(
      id: 1,
      name: ',بدون تغليف وبدون تدبيس,,,,,',
      price: 240.00,
      isSelected: true,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
    Product(
      id: 2,
      name: ',بدون تغليف وبدون تدبيس,',
      price: 220.00,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
  ];
  static List<Product> cartList = [
    Product(
      id: 1,
      name: ',بدون تغليف وبدون تدبيس,,,,,',
      price: 240.00,
      isSelected: true,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
    Product(
      id: 2,
      name: ',بدون تغليف وبدون تدبيس,,,,,',
      price: 190.00,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
    Product(
      id: 1,
      name: ',بدون تغليف وبدون تدبيس,,,,,',
      price: 220.00,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
    Product(
      id: 2,
      name: ',بدون تغليف وبدون تدبيس,,,,,',
      price: 240.00,
      isSelected: true,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
  ];
}

class Product {
  int id;
  String name;
  String image;
  double price;
  bool isliked;
  bool isSelected;
  int quantity;
  Product(
      {this.id,
      this.name,
      this.price,
      this.isliked,
      this.image,
      this.isSelected,
      this.quantity,
      this.isSelected = false,
      this.image});
}
