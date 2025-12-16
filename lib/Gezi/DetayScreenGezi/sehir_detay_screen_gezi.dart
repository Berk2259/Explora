import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Gezi/ContainerGezi/mekan_container_gezi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SehirDetayScreenGezi extends StatefulWidget {
  final String ulkeAdi;
  final String sehirAdi;
  const SehirDetayScreenGezi({super.key, required this.ulkeAdi, required this.sehirAdi});

  @override
  State<SehirDetayScreenGezi> createState() => _SehirDetayScreenGeziState();
}

class _SehirDetayScreenGeziState extends State<SehirDetayScreenGezi> {
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
    _mekanVerisi = veriyiGetir(FirebaseFirestore.instance.collection('sehirlergezi').doc(widget.ulkeAdi));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (d) => d.primaryVelocity! > 300 ? Navigator.of(context).pop() : null,
      child: Scaffold(
        backgroundColor: const Color(0xFF667eea),
        body: SafeArea(
          child: FutureBuilder<DocumentSnapshot>(
            future: _mekanVerisi,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator(color: Colors.white));
              if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) return const Center(child: Text("Veri yok.", style: TextStyle(color: Colors.white)));

              final data = snapshot.data!.data() as Map<String, dynamic>?;
              final sehirData = data?[widget.sehirAdi];
              if (sehirData == null) return const Center(child: Text("Şehir verisi yok.", style: TextStyle(color: Colors.white)));
              
              final liste = sehirData['mekanlar'] as List<dynamic>? ?? [];
              if (liste.isEmpty) return const Center(child: Text("Mekan yok.", style: TextStyle(color: Colors.white)));

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ...liste.map((e) => MekanContainerGezi(mekan: e as Map<String, dynamic>)),
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