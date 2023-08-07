import 'package:flutter/material.dart';

class PopularCategory {
  final String category;
  final String id;

  PopularCategory({this.category = '', this.id = ''});
}

class MostPopularCategory extends StatefulWidget {
  final List<PopularCategory> categories;
  final ValueChanged<int> onCategorySelected;

  const MostPopularCategory({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _MostPopularCategoryState createState() => _MostPopularCategoryState();
}

class _MostPopularCategoryState extends State<MostPopularCategory> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 38,
          child: ListView.separated(
            itemCount: widget.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: _buildItem,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 12);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final category = widget.categories[index];
    final isActive = _selectedIndex == index;
    const radius = BorderRadius.all(Radius.circular(19));
    return Container(
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
            category.category,
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

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onCategorySelected(index);
    });
  }
}
