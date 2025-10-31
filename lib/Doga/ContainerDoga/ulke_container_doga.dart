
import 'package:explora/Doga/DetayScreenDoga/detay_screen_doga.dart';
import 'package:flutter/material.dart';

//Her ülkenin container dosyası aynı şekilde oluşturulacak. Sadece içeriği değişecek.
class UlkeContainerDoga extends StatelessWidget {
  final String ulkeAdi;
  final String iconUlke;
  const UlkeContainerDoga({
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
            MaterialPageRoute(builder: (context) => UlkeDetayScreenDoga(ulkeAdi: ulkeAdi,)),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color(0xFFe8f5e9),
              ],
            ),
            border: Border.all(
              color: Color(0xFF4caf50).withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF4caf50).withOpacity(0.2),
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
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Color(0xFF66a6ff).withOpacity(0.4),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF66a6ff).withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(iconUlke, fit: BoxFit.cover),
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
                          Icon(Icons.park, size: 20, color: Color(0xFF4caf50)),
                          SizedBox(width: 6),
                          Text(
                            ulkeAdi,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1b5e20),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.eco, size: 14, color: Color(0xFF66a6ff)),
                          SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              'Doğal güzellikleri keşfetmek için çift tıklayın',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF388e3c),
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
                    color: Color(0xFF4caf50).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.nature, size: 24, color: Color(0xFF4caf50)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
