import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Eglence/ContainerEglence/container_eglence.dart';
import 'package:explora/Gezi/ContainerGezi/container_gezi.dart'; 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UlkeDetayScreenEglence extends StatefulWidget {
  final String ulkeAdi;
  const UlkeDetayScreenEglence({super.key, required this.ulkeAdi});

  @override
  State<UlkeDetayScreenEglence> createState() => _UlkeDetayScreenEglenceState();
}

class _UlkeDetayScreenEglenceState extends State<UlkeDetayScreenEglence> {
  late Future<DocumentSnapshot> _listeVerisi;

  // AYNI AKILLI "CACHE FIRST" FONKSİYONU BURAYA DA EKLİYORUZ
  Future<DocumentSnapshot> veriyiGetir(DocumentReference ref) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? sonGuncellemeZamani = prefs.getInt('son_guncelleme_${ref.id}');
      final int suAn = DateTime.now().millisecondsSinceEpoch;
      
      // 12 Saat (Milisaniye cinsinden) -> İstediğin süreyi ayarlayabilirsin
      const int yenilemeSuresi = 1000 * 60 * 60 * 12; 

      // 1. Durum: Eğer daha önce hiç indirmemişse veya süre dolmuşsa -> SUNUCUDAN ÇEK
      if (sonGuncellemeZamani == null || (suAn - sonGuncellemeZamani) > yenilemeSuresi) {
         print("Süre doldu veya ilk kez açılıyor. Sunucudan güncel veri çekiliyor...");
         throw Exception("Süre doldu, sunucuya git");
      }

      // 2. Durum: Süre dolmadıysa -> CACHE KULLAN
      print("Veri güncel. Cache kullanılıyor (Maliyet: 0)");
      DocumentSnapshot snapshot = await ref.get(const GetOptions(source: Source.cache));
      
      if (snapshot.exists && snapshot.data() != null) {
        return snapshot;
      }
      throw Exception("Cache boş");

    } catch (e) {
      // Hata veya "Süre doldu" durumunda burası çalışır:
      // Sunucudan taze veriyi çek
      DocumentSnapshot snapshot = await ref.get(const GetOptions(source: Source.server));
      
      // Başarılı olursa şu anki saati kaydet
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('son_guncelleme_${ref.id}', DateTime.now().millisecondsSinceEpoch);
      
      return snapshot;
    }
  }

  @override
  void initState() {
    super.initState();
    
    final ref = FirebaseFirestore.instance
        .collection('config')
        .doc('sehir_listeleri');
        
    // ARTIK BURADA "get()" DEĞİL, AKILLI FONKSİYONU ÇAĞIRIYORUZ
    _listeVerisi = veriyiGetir(ref); 
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
        backgroundColor: const Color(0xFFff6b6b),
        body: SafeArea(
          child: FutureBuilder<DocumentSnapshot>(
            future: _listeVerisi, 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || !snapshot.data!.exists) {
                return const Center(child: Text("Veri bulunamadı."));
              }

              final data = snapshot.data!.data() as Map<String, dynamic>?;

              // widget.ulkeAdi ile erişiyoruz
              final List<dynamic> hamListe = data?[widget.ulkeAdi] ?? [];

              if (hamListe.isEmpty) {
                return const Center(
                  child: Text("Bu ülke için şehir listesi henüz eklenmemiş."),
                );
              }

              final List<String> sehirIsimleri = hamListe.cast<String>();

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...sehirIsimleri.map((isim) {
                      return SehirContainerEglence(
                        sehirAdi: isim,
                        ulkeAdi: widget.ulkeAdi,
                      );
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