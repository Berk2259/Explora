import 'package:explora/Parti/ContainerParti/container_parti.dart';
import 'package:explora/Parti/DataParti/mekan_data_parti.dart';
import 'package:flutter/material.dart';

//Mekan kısımları yani şehirlerin detay kısımları burada bulunur
class SehirDetayScreenParti extends StatelessWidget {
  final String sehirAdi;

  const SehirDetayScreenParti({super.key, required this.sehirAdi});

  @override
  Widget build(BuildContext context) {
    List<String> mekanlar = MekanDataParti.mekanlar[sehirAdi]!;
    return Scaffold(
      backgroundColor: Color(0xFFff6b6b),
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
                    .map((mekan) => MekanContainerParti(mekanAdi: mekan, ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
