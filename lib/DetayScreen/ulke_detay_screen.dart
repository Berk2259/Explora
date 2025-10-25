import 'package:explora/Container/sehir_container.dart';
import 'package:explora/Data/ulke_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UlkeDetayScreen extends StatelessWidget {
    final String ulkeAdi;

  const UlkeDetayScreen({super.key,required this.ulkeAdi});

  @override
  Widget build(BuildContext context) {
    List<String> cities = UlkeData.ulkeler[ulkeAdi]!;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 300) {
              Navigator.of(context).pop();
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Şehirleri tek tek SehirContainer ile göster
                  ...cities.map((sehir) => SehirContainer(sehirAdi: sehir)).toList(),
                  
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
