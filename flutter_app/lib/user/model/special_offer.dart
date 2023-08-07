class SpecialOffer {
  final String discount;
  final String title;
  final String detail;
  final String icon;

  SpecialOffer({
    required this.discount,
    required this.title,
    required this.detail,
    required this.icon,
  });
}

final homeSpecialOffers = <SpecialOffer>[
   SpecialOffer(
    discount: 'welcome🙋',
    title: "to our application My_Pharmacy",
    detail: 'The efficient and timely delivery of pharmaceutical products is essential for ensuring patient care, maintaining product integrity, and optimizing the healthcare supply chain',
    icon: 'assets/icons/products/ordonnance1.png',
  ),
  SpecialOffer(
    discount: 'Hi😜',
    title: "scanne ordonnance",
    detail: 'you can started',
    icon: 'assets/icons/products/qrcode.png',
  ),
   SpecialOffer(
    discount: 'Hi😜',
    title: "scanne ordonnance",
    detail: 'you can started',
    icon: 'assets/icons/products/ordonnance2.png',
  ),
  
];
