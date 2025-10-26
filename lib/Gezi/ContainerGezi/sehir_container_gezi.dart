import 'package:explora/Gezi/DetayScreenGezi/sehir_detay_screen_gezi.dart';
import 'package:flutter/material.dart';

//Her şehir için kullanılacak konteyner bileşeni
class SehirContainerGezi extends StatelessWidget {
  final String sehirAdi;
  const SehirContainerGezi({required this.sehirAdi, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SehirDetayScreenGezi(sehirAdi: sehirAdi,)));
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
                  child: Image.asset('assets/images/city.png'),
                ),
                SizedBox(width: 20),
                Text(
                  sehirAdi,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_circle_right,
                    size: 40,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}