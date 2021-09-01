class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        title: 'Elean',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image:
            'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
        category: "elean"),
    Product(
        id: 2,
        title: ',Elean',
        price: 220.00,
        isliked: false,
        image:
            'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
        category: "elean"),
  ];

  static List<Product> cartList = [
    Product(
      id: 1,
      title: 'Elean',
      price: 240.00,
      isSelected: true,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
    Product(
      id: 2,
      title: 'Elean',
      price: 190.00,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
    Product(
      id: 1,
      title: 'Elean',
      price: 220.00,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
    Product(
      id: 2,
      title: 'Elean',
      price: 240.00,
      isSelected: true,
      isliked: false,
      image:
          'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
    ),
  ];

  static List<Category> categoryList = [
    Category(
        id: 0,
        titleRegions: "مفتوح",
        image:
            'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
        isSelected: true),
    Category(
        id: 1,
        titleRegions: "التوصيل مجاني",
        image:
            'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
        isSelected: true),
    Category(
      id: 2,
      titleRegions: "خدمة 24 ساعة",
      image:
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    ),
  ];
}

class Product {
  int id;
  String title;
  String category;
  String image;
  double price;
  bool isliked;
  bool isSelected;

  Product(
      {this.id,
      this.title,
      this.category,
      this.price,
      this.isliked,
      this.isSelected = false,
      this.image});
}

class Category {
  int id;
  String titleRegions;
  String image;
  bool isSelected;
  List<Product> productList;
  Category(
      {this.productList,
      this.id,
      this.titleRegions,
      this.isSelected = false,
      this.image});
}
