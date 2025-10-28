import 'package:flutter/material.dart';
import 'package:explora/Gezi/ContainerGezi/container_gezi.dart';

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
              UlkeContainerGezi(
                iconUlke: 'assets/images/turkey.png',
                ulkeAdi: 'Türkiye',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/spain.png',
                ulkeAdi: 'İspanya',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/france.png',
                ulkeAdi: 'Fransa',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/ıtaly.png',
                ulkeAdi: 'İtalya',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/germany.png',
                ulkeAdi: 'Almanya',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/poland.png',
                ulkeAdi: 'Polonya',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/netherlands.png',
                ulkeAdi: 'Hollanda',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/england.png',
                ulkeAdi: 'İngiltere',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/czech.png',
                ulkeAdi: 'Çekya',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/sweeden.png',
                ulkeAdi: 'İsveç',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/switzerland.png',
                ulkeAdi: 'İsviçre',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/norway.png',
                ulkeAdi: 'Norveç',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/portugal.png',
                ulkeAdi: 'Portekiz',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/greece.png',
                ulkeAdi: 'Yunanistan',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/austria.png',
                ulkeAdi: 'Avusturya',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/finland.png',
                ulkeAdi: 'Finlandiya',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/bulgaria.png',
                ulkeAdi: 'Bulgaristan',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/slovakia.png',
                ulkeAdi: 'Slovakya',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/albania.png',
                ulkeAdi: 'Arnavutluk',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/croatia.png',
                ulkeAdi: 'Hırvatistan',
              ),
              UlkeContainerGezi(
                iconUlke: 'assets/images/macedonia.png',
                ulkeAdi: 'Makedonya',
              ),  
              UlkeContainerGezi(
                iconUlke: 'assets/images/hungary.png',
                ulkeAdi: 'Macaristan',
              ),  
              UlkeContainerGezi(
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
