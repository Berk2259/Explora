import 'package:explora/Container/sehir_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UlkeDetayScreen extends StatelessWidget {
  const UlkeDetayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            SehirContainer(sehirAdi: 'Adana'),
            SehirContainer(sehirAdi: 'Adıyaman')
          ],
        ),
      ),
    );
  }
}
