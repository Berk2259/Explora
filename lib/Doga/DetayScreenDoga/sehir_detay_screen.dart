import 'package:explora/Doga/ContainerDoga/container_doga.dart';
import 'package:explora/Doga/DataDoga/mekan_data_doga.dart';
import 'package:flutter/material.dart';

//Mekan kısımları yani şehirlerin detay kısımları burada bulunur
class SehirDetayScreenDoga extends StatelessWidget {
  final String sehirAdi;

  const SehirDetayScreenDoga({super.key, required this.sehirAdi});

  @override
  Widget build(BuildContext context) {
    List<String> mekanlar = MekanDataDoga.mekanlar[sehirAdi]!;
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
                children: mekanlar
                    .map((mekan) => MekanContainerDoga(mekanAdi: mekan))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
