import 'package:explora/Doga/ContainerDoga/container_doga.dart';
import 'package:explora/Ortak/DataOrtak/data_ortak.dart';
import 'package:flutter/material.dart';

//Her ülkenin detay kısımları burada bulunur yani şehirlerin listelendiği ekran
class UlkeDetayScreenDoga extends StatelessWidget {
    final String ulkeAdi;
  const UlkeDetayScreenDoga({super.key,required this.ulkeAdi});

  @override
  Widget build(BuildContext context) {
    List<String> cities = UlkeSehirlerDataOrtak.ulkeler[ulkeAdi]!;
    return Scaffold(
      backgroundColor: Color(0xFFa8edea),
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
                  ...cities.map((sehir) => SehirContainerDoga(sehirAdi: sehir)).toList(),
                  
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
