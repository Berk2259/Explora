import 'package:explora/Yemek/DetayScreenYemek/detay_screen_yemek.dart';
import 'package:flutter/material.dart';

//Her şehir için kullanılacak konteyner bileşeni
class SehirContainerYemek extends StatelessWidget {
  final String sehirAdi;
  const SehirContainerYemek({required this.sehirAdi, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SehirDetayScreenYemek(sehirAdi: sehirAdi,)));
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
                  child: Image.asset('assets/icons/cityscape.png',color: Color(0xFFfcb69f),),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sehirAdi,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('Doğal güzellikleri görmek için çift tıklayın.',style: TextStyle(fontSize: 12),),
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