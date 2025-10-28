import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:explora/Doga/DataDoga/data_doga.dart';

//Her mekan için kullanılacak konteyner bileşeni
class MekanContainerDoga extends StatelessWidget {
  final String mekanAdi;
  const MekanContainerDoga({super.key, required this.mekanAdi});

  Future<void> _openMaps() async {
    final String? url = KonumDataDoga.konumlar[mekanAdi]?.first;

    if (url == null) {
      // Eğer bu mekan için link tanımlı değilse uyarı verelim
      debugPrint("Bu mekan için konum linki bulunamadı: $mekanAdi");
      return;
    }

    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Haritalar açılamadı!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () {
        _openMaps();
        },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset('assets/images/google-maps.png'),
                ),
              ),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mekanAdi,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Konum için çift tıklayın',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
