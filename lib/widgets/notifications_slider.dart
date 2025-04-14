import 'dart:async';
import 'package:flutter/material.dart';

class NotificaitonSlider extends StatefulWidget {
  const NotificaitonSlider({super.key});

  @override
  State<NotificaitonSlider> createState() => _NotificaitonSliderState();
}

class _NotificaitonSliderState extends State<NotificaitonSlider> {
  final PageController _pageController = PageController();

  final List<String> imagePaths = [
    'assets/images/apr.png',
    'assets/images/hsb.png',
    'assets/images/mbb.png',
    'assets/images/coilers.png',
    'assets/images/ascvd.png',
    'images/fusderbat.png',
    'assets/images/nt.png',
    'assets/images/petroteam.png',
    'images/amadfal.png',
  ];

  int currentPage = 0;

  
  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage < imagePaths.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: PageView.builder(
        controller: _pageController,
        itemCount: imagePaths.length,
        onPageChanged: (index) => setState(() => currentPage = index),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePaths[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
