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
    EglenceScreen(),
  ];

  // Her sayfa için renkler
  final List<Color> _pageColors = [
    Color(0xFF667eea),  // Gezi - Mor
    Color(0xFF81C784),  // Doğa - Mavi
    Color(0xFFfcb69f),  // Yemek - Turuncu
    Color(0xFF2c3e50),  // Mağaza - Koyu Gri
    Color(0xFFff6b6b),  // Parti - Kırmızı
  ];

  @override
  Widget build(BuildContext context) {
    final currentColor = _pageColors[_selectedIndex];
    return Scaffold(
      backgroundColor: currentColor,
      body: PageView(
        controller: _pageController,
        physics: const ClampingScrollPhysics(), // Android benzeri kaydırma
        onPageChanged: (index) {
          setState(() {
            _selectedIndex =
                index; // swipe yaptığında bottom bar da güncellensin
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: currentColor.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
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
                label: 'Eğlence',
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: currentColor,
            unselectedItemColor: Colors.black54,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
