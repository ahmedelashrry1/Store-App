import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/IntroWidget.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static String id = "IntroScreen";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final PageController _pageController = PageController();
  int _activePage = 0;

  // Define the main color here
  final Color mainColor = Color(0xff8AAE92);

  void onNextPage(){
    if(_activePage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'color': 0xff8AAE92,
      'title': 'Discover the best with Store',
      'image': 'assets/images/Mobile payments-pana.png',
      'description': "A variety of foods made by the best chef. Ingredients are easy to find, all delicious flavors can only be found at cookbunda",
      'skip': true
    },
    {
      'color': 0xff8AAE92,
      'title': 'Your shopping starts here',
      'image': 'assets/images/Online shopping-cuate.png',
      'description': 'Not all food, we provide clear healthy drink options for you. Fresh taste always accompanies you',
      'skip': true
    },
    {
      'color': 0xff8AAE92,
      'title': 'Welcome to Store',
      'image': 'assets/images/Online shopping-pana.png',
      'description': 'Are you ready to make a dish for your friends or family? create an account and cooks',
      'skip': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            scrollBehavior: AppScrollBehavior(),
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return IntroWidget(
                index: index,
                color: mainColor.value.toRadixString(16), // Convert Color to String
                title: _pages[index]['title'],
                description: _pages[index]['description'],
                image: _pages[index]['image'],
                skip: _pages[index]['skip'],
                onTab: onNextPage,
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator()
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];
    for (var i = 0; i < _pages.length; i++) {
      if (_activePage == i) {
        indicators.add(_indicatorsTrue());
      } else {
        indicators.add(_indicatorsFalse());
      }
    }
    return indicators;
  }

  Widget _indicatorsTrue() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: 42,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: mainColor, // Use mainColor here
      ),
    );
  }

  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }
}
