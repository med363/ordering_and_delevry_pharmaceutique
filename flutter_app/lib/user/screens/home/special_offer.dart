import 'package:flutter/material.dart';

import 'package:flutter_app/user/model/special_offer.dart';
import 'package:flutter_app/user/screens/mostpopular/most_popular_screen.dart';

import '../../components/special_offer_widget.dart';

typedef SpecialOffersOnTapSeeAll = void Function();

class SpecialOffers extends StatefulWidget {
  final SpecialOffersOnTapSeeAll? onTapSeeAll;
  const SpecialOffers({super.key, this.onTapSeeAll});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  
  late final List<SpecialOffer> specials = homeSpecialOffers;

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(),
        const SizedBox(height: 24),
        Stack(children: [
          Container(
            height: 181,
            decoration: const BoxDecoration(
              color: Color(0xFFE7E7E7),
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            child: PageView.builder(
              itemBuilder: (context, index) {
                final data = specials[index];
                return SpecialOfferWidget(context, data: data, index: index);
              },
              itemCount: specials.length,
              allowImplicitScrolling: true,
              onPageChanged: (value) {
                setState(() => selectIndex = value);
              },
            ),
          ),
          _buildPageIndicator()
        ]),
        const SizedBox(height: 24),
       ],
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'About us',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF212121)),
        ),
        TextButton(
          onPressed: () => widget.onTapSeeAll?.call(),
          child: const Text(
            'See All',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF212121)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < specials.length; i++) {
      list.add(i == selectIndex ? _indicator(true) : _indicator(false));
    }
    return Container(
      height: 181,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        height: 4.0,
        width: isActive ? 16 : 4.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          color: isActive ? const Color(0XFF101010) : const Color(0xFFBDBDBD),
        ),
      ),
    );
  }
}