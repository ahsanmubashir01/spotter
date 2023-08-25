import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PhotoFullScreen extends StatefulWidget {
  @override
  _PhotoFullScreenState createState() => _PhotoFullScreenState();
}

class _PhotoFullScreenState extends State<PhotoFullScreen> {
  int _selectedImageIndex = 0;
  List<String> _imageUrls = [
    'assets/images/opting.png',
    'assets/images/logo.png',
    'assets/images/opting.png',
    'assets/images/opting.png',
    'assets/images/opting.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              18,
              60,
              0,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/icons/backarrow.svg'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedImageIndex = 0; // Show the big image
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Image.asset(_imageUrls[_selectedImageIndex]),
                height: 400,
              ),
            ),
          ),
          Container(
            height: 90,
            child: Container(
              width: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _imageUrls.length - 1, // Excluding the big image
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImageIndex =
                            index + 1; // +1 because of the big image
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50), // Adjust the radius as needed
                        ),
                        child: Image.asset(_imageUrls[index + 1]),
                        height: 20,
                        width: 60,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
