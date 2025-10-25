import 'package:flutter/material.dart';
import 'package:explora/Container/container.dart';

class GeziScreen extends StatelessWidget {
  const GeziScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            UlkeContainer(iconUlke: 'assets/images/turkey.png',ulkeAdi: 'Türkiye',ButtonColor1: Colors.red,ButtonColor2: Colors.white,),
            UlkeContainer(iconUlke: 'assets/images/spain.png', ulkeAdi: 'İspanya', ButtonColor1: Colors.yellow,ButtonColor2: Colors.red,),
            UlkeContainer(iconUlke: 'assets/images/france.png', ulkeAdi: 'Fransa', ButtonColor1: Colors.blue,ButtonColor2: Colors.red,),
          ],
        ),
      ),
    );
  }
}
