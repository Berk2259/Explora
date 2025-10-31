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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFffecd2),
                Color(0xFFfcb69f),
                Color(0xFFff9a9e),
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Ülkeleri Keşfedin',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5a3d2b),
                    ),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: 23,
                  itemBuilder: (context, index) {
                    final countries = [
                      {'icon': 'assets/images/turkey.png', 'name': 'Türkiye'},
                      {'icon': 'assets/images/spain.png', 'name': 'İspanya'},
                      {'icon': 'assets/images/france.png', 'name': 'Fransa'},
                      {'icon': 'assets/images/ıtaly.png', 'name': 'İtalya'},
                      {'icon': 'assets/images/germany.png', 'name': 'Almanya'},
                      {'icon': 'assets/images/poland.png', 'name': 'Polonya'},
                      {'icon': 'assets/images/netherlands.png', 'name': 'Hollanda'},
                      {'icon': 'assets/images/england.png', 'name': 'İngiltere'},
                      {'icon': 'assets/images/czech.png', 'name': 'Çekya'},
                      {'icon': 'assets/images/sweeden.png', 'name': 'İsveç'},
                      {'icon': 'assets/images/switzerland.png', 'name': 'İsviçre'},
                      {'icon': 'assets/images/norway.png', 'name': 'Norveç'},
                      {'icon': 'assets/images/portugal.png', 'name': 'Portekiz'},
                      {'icon': 'assets/images/greece.png', 'name': 'Yunanistan'},
                      {'icon': 'assets/images/austria.png', 'name': 'Avusturya'},
                      {'icon': 'assets/images/finland.png', 'name': 'Finlandiya'},
                      {'icon': 'assets/images/bulgaria.png', 'name': 'Bulgaristan'},
                      {'icon': 'assets/images/slovakia.png', 'name': 'Slovakya'},
                      {'icon': 'assets/images/albania.png', 'name': 'Arnavutluk'},
                      {'icon': 'assets/images/croatia.png', 'name': 'Hırvatistan'},
                      {'icon': 'assets/images/macedonia.png', 'name': 'Makedonya'},
                      {'icon': 'assets/images/hungary.png', 'name': 'Macaristan'},
                      {'icon': 'assets/images/denmark.png', 'name': 'Danimarka'},
                    ];
                    final country = countries[index];
                    return UlkeContainerYemek(
                      iconUlke: country['icon']!,
                      ulkeAdi: country['name']!,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}