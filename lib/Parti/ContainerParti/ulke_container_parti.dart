
import 'package:explora/Parti/DetayScreenParti/detay_screen_parti.dart';
import 'package:flutter/material.dart';

//Her ülkenin container dosyası aynı şekilde oluşturulacak. Sadece içeriği değişecek.
class UlkeContainerParti extends StatelessWidget {
  final String ulkeAdi;
  final String iconUlke;
  const UlkeContainerParti({
    super.key,
    required this.ulkeAdi,
    required this.iconUlke,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UlkeDetayScreenParti(ulkeAdi: ulkeAdi,)),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color(0xFFfff0f5),
              ],
            ),
            border: Border.all(
              color: Color(0xFFff6b6b).withOpacity(0.4),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFff69b4).withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
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
                        Color(0xFFffd700),
                        Color(0xFFffa500),
                        Color(0xFFff6b6b),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFff69b4).withOpacity(0.4),
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
                          Icon(Icons.celebration, size: 20, color: Color(0xFFff6b6b)),
                          SizedBox(width: 6),
                          Text(
                            ulkeAdi,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8b0000),
                              letterSpacing: 0.5,
                              shadows: [
                                Shadow(
                                  color: Color(0xFFffd700).withOpacity(0.5),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.music_note, size: 14, color: Color(0xFFff69b4)),
                          SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              'Eğlence mekanları için çift tıklayın',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF8b0000).withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFff6b6b), Color(0xFFff69b4)],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFff69b4).withOpacity(0.5),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(Icons.local_fire_department, size: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
