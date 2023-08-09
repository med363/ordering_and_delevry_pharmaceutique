import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Feature/Login%20Screen/Login_Screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  int _current = 0;
  final List<String> images = [
    'assets/images/qr-code.jpg',
    'assets/images/pharmacie.png',
  ];

  final List<String> comments = ['scanne preception', 'call your pharmacy'];

  List<Widget> generateImagesTitle() {
    return images
        .map((e) => ClipRRect(
              child: Image.asset(e,
                fit: BoxFit.cover,
                width: 1000,
              
              ),
              borderRadius: BorderRadius.circular(20.0),
            ))
        .toList();
  }
  void _onIndicatorTapped(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),

      color: Colors.white,
      padding: const EdgeInsets.only(top: 50),
      child: Stack(children: [
        CarouselSlider(
            items: generateImagesWithGesture(),
            options: CarouselOptions(
                onPageChanged: (index, _) {
                  setState(() {
                    _current = index;
                  });
                },
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 1.0, // Set to 1.0 for full-width carousel
                aspectRatio: 18 / 8, // Adjust aspectRatio as needed
                // autoPlay: true,
                pageSnapping: true,
                autoPlayInterval: Duration(seconds: 2),
                enlargeStrategy: CenterPageEnlargeStrategy.height)),
        AspectRatio(
          aspectRatio: 18 / 8,
          child:Align(
              alignment: FractionalOffset.bottomLeft,

          child: Container(
                margin: EdgeInsets.only(left: 50, bottom: 24.0),

            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              comments[_current],
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          )
                       

          
        ),
         Positioned(
          
            bottom: 10,
            left: 308,
            right: 0,
            child: buildIndicator(),
          ),
      ]),
    );
  }
  Widget buildIndicator()=> AnimatedSmoothIndicator(
 activeIndex: _current,
 count: images.length,
 effect: WormEffect(
  dotWidth: 20,
  dotHeight: 20,
  activeDotColor: Colors.blue,
  dotColor: Colors.black12
 ),
         onDotClicked: _onIndicatorTapped,

);
List<Widget> generateImagesWithGesture() {
  return images.asMap().entries.map((entry) {
    int index = entry.key;
    String image = entry.value;
    return GestureDetector(
      onTap: () {
        // Handle the tap event here and navigate to another page.
        // For example:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: ClipRRect(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: 1000,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }).toList();

}




}