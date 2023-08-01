class PopularCategory {
  final String category;
  final String id;

  PopularCategory({this.category = '', this.id = ''});
}

class Product {
  final String title;
  final double star;
  final int sold;
  final double price;
  final String icon;
  final String id;

  Product(
      {this.title = '',
      this.star = 0.0,
      this.sold = 0,
      this.price = 0.0,
      this.icon = '',
      this.id = '0'});
}

final homePopularCategories = [
  PopularCategory(category: 'All', id: '1'),
  PopularCategory(category: 'Visage', id: '2'),
  PopularCategory(category: 'Cheveux', id: '3'),
  PopularCategory(category: 'Corps', id: '4'),
  PopularCategory(category: 'Bébé et Maman', id: '5'),
  PopularCategory(category: 'Compléments alimentaires', id: '6'),
  PopularCategory(category: 'Matériel médical', id: '7'),
  PopularCategory(category: 'Bio et Naturel', id: '8'),
  PopularCategory(category: 'Others', id: '9'),
];

final homePopularProducts = [
  Product(
    title: 'SVR',
    star: 4.5,
    sold: 8374,
    price: 52.900,
    icon: 'assets/icons/products/svr.jpg',
  ),
  Product(
    title: 'la roche',
    star: 4.7,
    sold: 7483,
    price: 56.900,
    icon: 'assets/icons/products/laroche.webp',
  ),
  Product(
    title: 'kreine',
    star: 4.3,
    sold: 6937,
    price: 40.00,
    icon: 'assets/icons/products/kreine.png',
  ),
  Product(
    title: 'apothica',
    star: 4.9,
    sold: 8174,
    price: 55.00,
    icon: 'assets/icons/products/apothica.png',
  ),
  Product(
    title: 'phsiomer',
    star: 4.9,
    sold: 8174,
    price: 16.000,
    icon: 'assets/icons/products/phsiomer.png',
  ),
  Product(
    title: 'sucette',
    star: 4.9,
    sold: 8174,
    price: 19.600,
    icon: 'assets/icons/products/sucette.png',
  ),
  Product(
    title: 'calino',
    star: 4.9,
    sold: 8174,
    price: 41.000,
    icon: 'assets/icons/products/calino.png',
  ),
  Product(
    title: 'mustela',
    star: 4.9,
    sold: 8174,
    price: 55.00,
    icon: 'assets/icons/products/mustela.png',
  ),
  Product(
    title: 'mustela1',
    star: 4.9,
    sold: 8174,
    price: 35.345,
    icon: 'assets/icons/products/mustela1.png',
  ),
  Product(
    title: 'pediakids',
    star: 4.9,
    sold: 8174,
    price: 9.900,
    icon: 'assets/icons/products/pediakids.png',
  ),
  Product(
    title: 'bionime',
    star: 4.9,
    sold: 8174,
    price: 80.600,
    icon: 'assets/icons/products/bionime.png',
  ),
  Product(
    title: 'beurer',
    star: 4.9,
    sold: 8174,
    price: 113.900,
    icon: 'assets/icons/products/beurer.png',
  ),
  Product(
    title: 'beurer-appareil',
    star: 4.9,
    sold: 8174,
    price: 376.600,
    icon: 'assets/icons/products/beurer-appareil.png',
  ),
];
