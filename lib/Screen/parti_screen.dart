import 'package:explora/Widget/ortak_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:explora/Parti/ContainerParti/container_parti.dart';

class PartiScreen extends StatelessWidget {
  const PartiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrtakAppBar(
      title: "Parti Mekanları",
      appBarColor: Color(0xFFff6b6b),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Color(0xFFff6b6b),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                UlkeContainerParti(
                  iconUlke: 'assets/images/turkey.png',
                  ulkeAdi: 'Türkiye',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/spain.png',
                  ulkeAdi: 'İspanya',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/france.png',
                  ulkeAdi: 'Fransa',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/ıtaly.png',
                  ulkeAdi: 'İtalya',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/germany.png',
                  ulkeAdi: 'Almanya',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/poland.png',
                  ulkeAdi: 'Polonya',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/netherlands.png',
                  ulkeAdi: 'Hollanda',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/england.png',
                  ulkeAdi: 'İngiltere',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/czech.png',
                  ulkeAdi: 'Çekya',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/sweeden.png',
                  ulkeAdi: 'İsveç',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/switzerland.png',
                  ulkeAdi: 'İsviçre',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/norway.png',
                  ulkeAdi: 'Norveç',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/portugal.png',
                  ulkeAdi: 'Portekiz',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/greece.png',
                  ulkeAdi: 'Yunanistan',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/austria.png',
                  ulkeAdi: 'Avusturya',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/finland.png',
                  ulkeAdi: 'Finlandiya',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/bulgaria.png',
                  ulkeAdi: 'Bulgaristan',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/slovakia.png',
                  ulkeAdi: 'Slovakya',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/albania.png',
                  ulkeAdi: 'Arnavutluk',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/croatia.png',
                  ulkeAdi: 'Hırvatistan',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/macedonia.png',
                  ulkeAdi: 'Makedonya',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/hungary.png',
                  ulkeAdi: 'Macaristan',
                ),
                UlkeContainerParti(
                  iconUlke: 'assets/images/denmark.png',
                  ulkeAdi: 'Danimarka',
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
