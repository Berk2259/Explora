import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Doga/ContainerDoga/container_doga.dart';
import 'package:explora/Gezi/ContainerGezi/mekan_container_gezi.dart'; // Senin widget yolun
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SehirDetayScreenDoga extends StatefulWidget {
  final String ulkeAdi;
  final String sehirAdi;

  const SehirDetayScreenDoga({
    super.key,
    required this.ulkeAdi,
    required this.sehirAdi,
  });

  @override
  State<SehirDetayScreenDoga> createState() => _SehirDetayScreenDogaState();
}

class _SehirDetayScreenDogaState extends State<SehirDetayScreenDoga> {
  late Future<DocumentSnapshot> _mekanVerisi;

  Future<DocumentSnapshot> veriyiGetir(DocumentReference ref) async {
    final prefs = await SharedPreferences.getInstance();
    final String zamanKey = 'son_guncelleme_mekanlar_${ref.id}';
    final int? sonGuncelleme = prefs.getInt(zamanKey);
    final int suAn = DateTime.now().millisecondsSinceEpoch;
    
    // --- BURAYA DİKKAT ---
    // 1 SAAT = 1000 ms * 60 sn * 60 dk
    const int limit = 1000 * 60 * 60; 

    // --- DEDEKTİF BAŞLIYOR ---
    if (sonGuncelleme != null) {
      final fark = suAn - sonGuncelleme;
      final gecenDakika = fark / 1000 / 60; // Dakikaya çevir
      final limitDakika = limit / 1000 / 60;
      
      print("--------------------------------------------------");
      print("🕵️ DEDEKTİF RAPORU:");
      print("🕒 Ayarlanan Limit: ${limitDakika.toStringAsFixed(1)} Dakika (1 Saat)");
      print("⏱️ Geçen Süre: ${gecenDakika.toStringAsFixed(1)} Dakika");
      
      if (fark > limit) {
        print("❌ SONUÇ: Süre DOLMUŞ. (Mecburen okuma yapılacak)");
      } else {
        print("✅ SONUÇ: Süre DOLMAMIŞ. (${(limitDakika - gecenDakika).toStringAsFixed(1)} dk daha var)");
        print("🛡️ İŞLEM: CACHE KULLANILIYOR (Okuma: 0)");
      }
      print("--------------------------------------------------");
    } else {
      print("🕵️ DEDEKTİF: İlk giriş veya kayıt yok. Okuma yapılıyor...");
    }
    // -------------------------

    bool sunucuyaGit = (sonGuncelleme == null) || (suAn - sonGuncelleme > limit);

    if (sunucuyaGit) {
      try {
        var snap = await ref.get(const GetOptions(source: Source.server));
        await prefs.setInt(zamanKey, suAn);
        print("🚀 SUNUCUDAN ÇEKİLDİ (Faturaya +1 yansıdı)");
        return snap;
      } catch (e) {
        print("⚠️ HATA: Sunucu yok, Cache'e dönüldü.");
        return await ref.get(const GetOptions(source: Source.cache));
      }
    }
    return await ref.get(const GetOptions(source: Source.cache));
  }

  @override
  void initState() {
    super.initState();
    // SENİN MEKANLAR KOLEKSİYONUN BURASI
    final ref = FirebaseFirestore.instance
        .collection('sehirlerdoga') 
        .doc(widget.ulkeAdi);

    _mekanVerisi = veriyiGetir(ref);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 300) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF81C784),
      
        body: SafeArea(
          child: FutureBuilder<DocumentSnapshot>(
            future: _mekanVerisi,
            builder: (context, snapshot) {
              
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.white));
              }
      
              if (snapshot.hasError) {
                return Center(child: Text("Hata: ${snapshot.error}"));
              }
      
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return const Center(child: Text("Veri bulunamadı (Ülke Yok)."));
              }
      
              // --- VERİ AYIKLAMA ---
              final ulkeVerisi = snapshot.data!.data() as Map<String, dynamic>?;
              
              // Ülkenin içinden Şehri buluyoruz
              final sehirDetaylari = ulkeVerisi?[widget.sehirAdi];
      
              if (sehirDetaylari == null) {
                return const Center(child: Text("Bu şehre ait veri yok.", style: TextStyle(color: Colors.white)));
              }
              
              // Şehrin içinden 'mekanlar' listesini alıyoruz
              final mekanlarListesi = sehirDetaylari['mekanlar'];
      
              if (mekanlarListesi == null || (mekanlarListesi is List && mekanlarListesi.isEmpty)) {
                 return const Center(child: Text("Bu şehirde henüz mekan ekli değil.", style: TextStyle(color: Colors.white)));
              }
      
              final List<dynamic> liste = mekanlarListesi as List<dynamic>;
      
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    // MEKANLARI LİSTELİYORUZ
                    ...liste.map((item) {
                      final mekanMap = item as Map<String, dynamic>;
                      return MekanContainerDoga(mekan: mekanMap);
                    }),
                    const SizedBox(height: 32),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}