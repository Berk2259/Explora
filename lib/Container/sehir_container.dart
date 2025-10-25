import 'package:explora/DetayScreen/sehir_detay_screen.dart';
import 'package:flutter/material.dart';

//Her şehir için kullanılacak konteyner bileşeni
class SehirContainer extends StatelessWidget {
  final String sehirAdi;
  const SehirContainer({required this.sehirAdi, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SehirDetayScreen()));
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
