import 'package:explora/Yemek/DetayScreenYemek/detay_screen_yemek.dart';
import 'package:flutter/material.dart';

//Her ülkenin container dosyası aynı şekilde oluşturulacak. Sadece içeriği değişecek.
class UlkeContainerYemek extends StatelessWidget {
  final String ulkeAdi;
  final String iconUlke;
  const UlkeContainerYemek({
    super.key,
    required this.ulkeAdi,
    required this.iconUlke,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UlkeDetayScreenYemek(ulkeAdi: ulkeAdi),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color(0xFFe8f5e9)],
            ),
            border: Border.all(
              color: Color(0xFF2c3e50).withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF2c3e50).withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFFD3B6),
                        Color(0xFFFCB69F),
                        Color(0xFFFF8C42),

                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFfcb69f).withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(6),
                    child: ClipOval(
                      child: Image.asset(iconUlke, fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/shop.png', scale: 20, color: Color(0xFFfcb69f)),
                          SizedBox(width: 6),
                          Text(
                            ulkeAdi,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset('assets/icons/plate.png', scale: 25, color: Color(0xFFfcb69f)),
                          SizedBox(width: 4),
                          Flexible(
                            child: Text(
                               'Yemek Yerlerine Ulaşmak için çift tıkalayın',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFFfcb69f),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFfcb69f).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/icons/salad.png', scale: 25, ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
