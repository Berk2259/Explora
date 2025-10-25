import 'package:explora/Gezi/Container/container.dart';
import 'package:explora/Gezi/Data/mekan_data.dart';
import 'package:flutter/material.dart';

//Mekan kısımları yani şehirlerin detay kısımları burada bulunur
class SehirDetayScreen extends StatelessWidget {
  final String sehirAdi;

  const SehirDetayScreen({super.key, required this.sehirAdi});

  @override
  Widget build(BuildContext context) {
    List<String> mekanlar = MekanData.mekanlar[sehirAdi]!;
    

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
                children: mekanlar
                    .map((mekan) => MekanContainer(mekanAdi: mekan, ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
