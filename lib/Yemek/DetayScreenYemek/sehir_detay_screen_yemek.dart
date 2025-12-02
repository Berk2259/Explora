import 'package:explora/Yemek/ContainerYemek/container_yemek.dart';
import 'package:explora/Yemek/DataYemek/mekan_data_yemek.dart';
import 'package:flutter/material.dart';

//Mekan kısımları yani şehirlerin detay kısımları burada bulunur
class SehirDetayScreenYemek extends StatelessWidget {
  final String sehirAdi;

  const SehirDetayScreenYemek({super.key, required this.sehirAdi});

  @override
  Widget build(BuildContext context) {
    List<String> mekanlar = MekanDataYemek.mekanlar[sehirAdi]!;
    return Scaffold(
      backgroundColor: Color(0xFFfcb69f),
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
                children: mekanlar
                    .map((mekan) => MekanContainerYemek(mekanAdi: mekan, ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
