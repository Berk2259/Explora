import 'package:explora/Widget/ortak_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:explora/Doga/ContainerDoga/container_doga.dart';

class DogaScreen extends StatelessWidget {
  const DogaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrtakAppBar(
      title: "Doğal Mekanlar",
      appBarColor: Color(0xFF81C784),
      seciliEkran: DogaScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color:  Color(0xFF81C784),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                UlkeContainerDoga(
                  iconUlke: 'assets/images/turkey.png',
                  ulkeAdi: 'Türkiye',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/spain.png',
                  ulkeAdi: 'İspanya',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/france.png',
                  ulkeAdi: 'Fransa',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/ıtaly.png',
                  ulkeAdi: 'İtalya',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/germany.png',
                  ulkeAdi: 'Almanya',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/poland.png',
                  ulkeAdi: 'Polonya',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/netherlands.png',
                  ulkeAdi: 'Hollanda',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/england.png',
                  ulkeAdi: 'İngiltere',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/czech.png',
                  ulkeAdi: 'Çekya',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/sweeden.png',
                  ulkeAdi: 'İsveç',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/switzerland.png',
                  ulkeAdi: 'İsviçre',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/norway.png',
                  ulkeAdi: 'Norveç',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/portugal.png',
                  ulkeAdi: 'Portekiz',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/greece.png',
                  ulkeAdi: 'Yunanistan',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/austria.png',
                  ulkeAdi: 'Avusturya',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/finland.png',
                  ulkeAdi: 'Finlandiya',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/bulgaria.png',
                  ulkeAdi: 'Bulgaristan',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/slovakia.png',
                  ulkeAdi: 'Slovakya',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/albania.png',
                  ulkeAdi: 'Arnavutluk',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/croatia.png',
                  ulkeAdi: 'Hırvatistan',
                ),
                UlkeContainerDoga(
                  iconUlke: 'assets/images/macedonia.png',
                  ulkeAdi: 'Makedonya',
                ),  
                UlkeContainerDoga(
                  iconUlke: 'assets/images/hungary.png',
                  ulkeAdi: 'Macaristan',
                ),  
                UlkeContainerDoga(
                  iconUlke: 'assets/images/denmark.png',
                  ulkeAdi: 'Danimarka',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
