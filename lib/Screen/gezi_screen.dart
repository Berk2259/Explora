import 'package:flutter/material.dart';
import 'package:explora/Gezi/Container/container.dart';

class GeziScreen extends StatelessWidget {
  const GeziScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UlkeContainer(iconUlke: 'assets/images/turkey.png',ulkeAdi: 'Türkiye',),
              UlkeContainer(iconUlke: 'assets/images/spain.png', ulkeAdi: 'İspanya', ),
              UlkeContainer(iconUlke: 'assets/images/france.png', ulkeAdi: 'Fransa', ),
              UlkeContainer(iconUlke: 'assets/images/ıtaly.png', ulkeAdi: 'İtalya', ),
              UlkeContainer(iconUlke: 'assets/images/germany.png', ulkeAdi: 'Almanya', ),
              UlkeContainer(iconUlke: 'assets/images/poland.png', ulkeAdi: 'Polonya', ),
              UlkeContainer(iconUlke: 'assets/images/netherlands.png', ulkeAdi: 'Hollanda', ),
              UlkeContainer(iconUlke: 'assets/images/england.png', ulkeAdi: 'İngiltere', ),
              UlkeContainer(iconUlke: 'assets/images/czech.png', ulkeAdi: 'Çekya', ),
              UlkeContainer(iconUlke: 'assets/images/sweeden.png', ulkeAdi: 'İsveç', ),
              UlkeContainer(iconUlke: 'assets/images/switzerland.png', ulkeAdi: 'İsviçre', ),
              UlkeContainer(iconUlke: 'assets/images/norway.png', ulkeAdi: 'Norveç', ),
              UlkeContainer(iconUlke: 'assets/images/portugal.png', ulkeAdi: 'Portekiz', ),
              UlkeContainer(iconUlke: 'assets/images/greece.png', ulkeAdi: 'Yunanistan', ),
              UlkeContainer(iconUlke: 'assets/images/austria.png', ulkeAdi: 'Avusturya', ),
              UlkeContainer(iconUlke: 'assets/images/finland.png', ulkeAdi: 'Finlandiya', ),
              UlkeContainer(iconUlke: 'assets/images/bulgaria.png', ulkeAdi: 'Bulgaristan', ),
            ],
          ),
        ),
      ),
    );
  }
}
