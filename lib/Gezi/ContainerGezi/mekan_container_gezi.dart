import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MekanContainerGezi extends StatelessWidget {
  final Map<String, dynamic> mekan; // artık map alıyor
  const MekanContainerGezi({super.key, required this.mekan});

  Future<void> _openMaps() async {
    final String? url = mekan['konum'];
    if (url == null || url.isEmpty) {
      debugPrint("Bu mekan için konum linki bulunamadı: ${mekan['isim']}");
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
    final mekanAdi = mekan['isim'] ?? 'Bilinmeyen Mekan';

    return GestureDetector(
      onDoubleTap: _openMaps,
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
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      mekanAdi,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      minFontSize: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      'Konum için çift tıklayın',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
