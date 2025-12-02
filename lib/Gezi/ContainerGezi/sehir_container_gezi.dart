import 'package:flutter/material.dart';
import 'package:explora/Gezi/DetayScreenGezi/sehir_detay_screen_gezi.dart';

//Her şehir için kullanılacak konteyner bileşeni firebase bağlantısından sonra burada bir değşiklik olmadı
class SehirContainerGezi extends StatelessWidget {
  final String sehirAdi;
  const SehirContainerGezi({required this.sehirAdi, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SehirDetayScreenGezi(sehirAdi: sehirAdi),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/icons/cityscape.png',
                    color: const Color(0xFF667eea),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sehirAdi,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Gezilecek yerlere ulaşmak için çift tıklayın.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
