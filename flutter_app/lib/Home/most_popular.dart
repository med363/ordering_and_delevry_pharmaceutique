import 'package:flutter/material.dart';
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


class MostPupularCategory extends StatefulWidget {
  const MostPupularCategory({super.key});

  @override
  State<MostPupularCategory> createState() => _MostPupularCategoryState();
}

class _MostPupularCategoryState extends State<MostPupularCategory> {
  late final datas = homePopularCategories;

  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBody(),
      ],
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        itemCount: datas.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: _buildItem,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final data = datas[index];
    final isActive = _selectIndex == index;
    const radius = BorderRadius.all(Radius.circular(19));
    return 
    Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(color: const Color(0xFF101010), width: 2),
        color: isActive ? const Color(0xFF101010) : const Color(0xFFFFFFFF),
      ),
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: radius,
        onTap: () => _onTapItem(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          child: Text(
            data.category,
            style: TextStyle(
              color: isActive ? const Color(0xFFFFFFFF) : const Color(0xFF101010),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // user interact the item of special offers.
  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}

class MostPopularTitle extends StatelessWidget {
  const MostPopularTitle({
    Key? key,
    required this.onTapseeAll,
  }) : super(key: key);

  final Function onTapseeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Parapharmacie', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF212121))),
        TextButton(
          onPressed: () => onTapseeAll(),
          child: const Text(
            'See All',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF212121),
            ),
          ),
        ),
      ],
    );
  }
}
