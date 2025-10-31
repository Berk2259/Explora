import 'package:explora/Screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    GeziScreen(),
    DogaScreen(),
    YemekScreen(),
    MagazaScreen(),
    PartiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // swipe kapalı
        children: _pages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut, // slide animasyonu
                );
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: 'Gezi',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.park), label: 'Doğa'),
              BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                label: 'Yemek ',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bagShopping),
                label: 'Mağaza',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.celebration),
                label: 'Parti',
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.blue.shade900,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
