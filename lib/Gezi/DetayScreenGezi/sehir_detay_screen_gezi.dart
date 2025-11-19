import 'package:explora/Gezi/ContainerGezi/container_gezi.dart';
import 'package:explora/Gezi/DataGezi/mekan_data_gezi.dart';
import 'package:flutter/material.dart';

//Mekan kısımları yani şehirlerin detay kısımları burada bulunur
class SehirDetayScreenGezi extends StatelessWidget {
  final String sehirAdi;

  const SehirDetayScreenGezi({super.key, required this.sehirAdi});

  @override
  Widget build(BuildContext context) {
    List<String> mekanlar = MekanDataGezi.mekanlar[sehirAdi]!;
    return Scaffold(
      backgroundColor: Color(0xFF667eea),
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 300) {
              Navigator.of(context).pop();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...mekanlar
                    .map((mekan) => MekanContainerGezi(mekanAdi: mekan))
                    .toList(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
