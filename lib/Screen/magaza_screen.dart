import 'package:flutter/material.dart';
import 'package:explora/Magaza/ContainerMagaza/container_magaza.dart';

class MagazaScreen extends StatelessWidget {
  const MagazaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UlkeContainerMagaza(
                iconUlke: 'assets/images/turkey.png',
                ulkeAdi: 'Türkiye',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/spain.png',
                ulkeAdi: 'İspanya',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/france.png',
                ulkeAdi: 'Fransa',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/ıtaly.png',
                ulkeAdi: 'İtalya',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/germany.png',
                ulkeAdi: 'Almanya',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/poland.png',
                ulkeAdi: 'Polonya',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/netherlands.png',
                ulkeAdi: 'Hollanda',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/england.png',
                ulkeAdi: 'İngiltere',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/czech.png',
                ulkeAdi: 'Çekya',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/sweeden.png',
                ulkeAdi: 'İsveç',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/switzerland.png',
                ulkeAdi: 'İsviçre',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/norway.png',
                ulkeAdi: 'Norveç',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/portugal.png',
                ulkeAdi: 'Portekiz',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/greece.png',
                ulkeAdi: 'Yunanistan',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/austria.png',
                ulkeAdi: 'Avusturya',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/finland.png',
                ulkeAdi: 'Finlandiya',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/bulgaria.png',
                ulkeAdi: 'Bulgaristan',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/slovakia.png',
                ulkeAdi: 'Slovakya',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/albania.png',
                ulkeAdi: 'Arnavutluk',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/croatia.png',
                ulkeAdi: 'Hırvatistan',
              ),
              UlkeContainerMagaza(
                iconUlke: 'assets/images/macedonia.png',
                ulkeAdi: 'Makedonya',
              ),  
              UlkeContainerMagaza(
                iconUlke: 'assets/images/hungary.png',
                ulkeAdi: 'Macaristan',
              ),  
              UlkeContainerMagaza(
                iconUlke: 'assets/images/denmark.png',
                ulkeAdi: 'Danimarka',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
