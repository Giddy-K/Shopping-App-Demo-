import 'package:flutter/material.dart';

//! You need to change the IP to your current devices' IP for the auth to work!!
//? The port must remains 3000
String uri = 'http://192.168.101.28:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 201, 29, 29),
      Color.fromARGB(255, 221, 125, 125),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 255, 0, 0);
  static const ratingColor = Colors.yellow;
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.red[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://farmhouseguide.com/wp-content/uploads/2022/05/Farm-black-and-white-cows-graze-in-meadow-ee220511-735x429.png.webp',
    'https://farmhouseguide.com/wp-content/uploads/2022/05/The-Jersey-cow-ee220511-735x429.png.webp',
    'https://images.freeimages.com/images/large-previews/9d0/sheep-1639780.jpg',
    'https://images.freeimages.com/images/large-previews/151/free-ducks-and-hens-images-1632436.jpg',
    'https://images.freeimages.com/images/large-previews/e30/free-chicken-riding-pig-image-1632467.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Cows',
      'image': 'assets/images/cows3.png',
    },
    {
      'title': 'Goats',
      'image': 'assets/images/goats2.png',
    },
    {
      'title': 'Sheep',
      'image': 'assets/images/sheep.jpg',
    },
    {
      'title': 'Others',
      'image': 'assets/images/hen.png',
    },
    {
      'title': 'Products',
      'image': 'assets/images/products.png',
    },
  ];
}
