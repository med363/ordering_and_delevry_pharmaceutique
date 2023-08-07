import 'package:flutter/material.dart';
import 'package:flutter_app/Pharmacien/model/qr_scan_screen.dart';

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
    discount: 'Welcome👩‍⚕️',
    title: "to our application My_Pharma",
    detail: 'Cette application permet de détecter les fraudes médicamenteuses',
    icon: 'assets/icons/products/qrcode.png',
    
  ),
];

// class YourScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Votre application')),
//       body: Center(
//         child: InkWell(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => QRScanScreen()));
//           },
//           child: Image.asset('assets/icons/products/qrcode.png'),
//         ),
//       ),
//     );
//   }
// }
