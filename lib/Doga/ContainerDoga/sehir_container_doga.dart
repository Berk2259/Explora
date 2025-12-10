import 'package:explora/Doga/DetayScreenDoga/detay_screen_doga.dart';
import 'package:flutter/material.dart';

//Her şehir için kullanılacak konteyner bileşeni
class SehirContainerDoga extends StatelessWidget {
  final String sehirAdi;
  const SehirContainerDoga({required this.sehirAdi, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SehirDetayScreenDoga(sehirAdi: sehirAdi,)));
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
                  child: Image.asset('assets/icons/cityscape.png',color:Color(0xFF81C784),),
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