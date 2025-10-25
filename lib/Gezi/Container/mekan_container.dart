import 'package:flutter/material.dart';

//Her mekan için kullanılacak konteyner bileşeni
class MekanContainer extends StatelessWidget {
  final String mekanAdi;

  const MekanContainer({
    super.key,
    required this.mekanAdi,
 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(Icons.location_pin, size: 50,),
            ),
            SizedBox(width: 20),
            Text(
              mekanAdi,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
