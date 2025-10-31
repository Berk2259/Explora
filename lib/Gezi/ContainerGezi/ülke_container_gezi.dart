
import 'package:explora/Gezi/DetayScreenGezi/detay_screen_gezi.dart';
import 'package:flutter/material.dart';

//Her ülkenin container dosyası aynı şekilde oluşturulacak. Sadece içeriği değişecek.
class UlkeContainerGezi extends StatelessWidget {
  final String ulkeAdi;
  final String iconUlke;
  const UlkeContainerGezi({
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
            MaterialPageRoute(builder: (context) => UlkeDetayScreenGezi(ulkeAdi: ulkeAdi,)),
          );
        },
        child: Container(
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(12),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(iconUlke, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ulkeAdi,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2d3748),
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 14, color: Color(0xFF667eea)),
                          SizedBox(width: 4),
                          Text(
                            'Şehirlere ulaşmak için çift tıklayın.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF667eea)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
