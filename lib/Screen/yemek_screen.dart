import 'package:explora/Widget/ortak_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:explora/Yemek/ContainerYemek/container_yemek.dart';

class YemekScreen extends StatelessWidget {
  const YemekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrtakAppBar(
      title: "Yemek Yerleri",
      appBarColor: Color(0xFFfcb69f),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color:  Color(0xFFfcb69f),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                UlkeContainerYemek(
                  iconUlke: 'assets/images/turkey.png',
                  ulkeAdi: 'Türkiye',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/spain.png',
                  ulkeAdi: 'İspanya',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/france.png',
                  ulkeAdi: 'Fransa',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/ıtaly.png',
                  ulkeAdi: 'İtalya',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/germany.png',
                  ulkeAdi: 'Almanya',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/poland.png',
                  ulkeAdi: 'Polonya',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/netherlands.png',
                  ulkeAdi: 'Hollanda',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/england.png',
                  ulkeAdi: 'İngiltere',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/czech.png',
                  ulkeAdi: 'Çekya',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/sweeden.png',
                  ulkeAdi: 'İsveç',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/switzerland.png',
                  ulkeAdi: 'İsviçre',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/norway.png',
                  ulkeAdi: 'Norveç',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/portugal.png',
                  ulkeAdi: 'Portekiz',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/greece.png',
                  ulkeAdi: 'Yunanistan',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/austria.png',
                  ulkeAdi: 'Avusturya',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/finland.png',
                  ulkeAdi: 'Finlandiya',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/bulgaria.png',
                  ulkeAdi: 'Bulgaristan',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/slovakia.png',
                  ulkeAdi: 'Slovakya',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/albania.png',
                  ulkeAdi: 'Arnavutluk',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/croatia.png',
                  ulkeAdi: 'Hırvatistan',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/macedonia.png',
                  ulkeAdi: 'Makedonya',
                ),
                UlkeContainerYemek(
                  iconUlke: 'assets/images/hungary.png',
                  ulkeAdi: 'Macaristan',
                ),
                UlkeContainerYemek(
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
