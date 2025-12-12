import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Gezi/ContainerGezi/container_gezi.dart';
import 'package:flutter/material.dart';

class UlkeDetayScreenGezi extends StatelessWidget {
  final String ulkeAdi;
  const UlkeDetayScreenGezi({super.key, required this.ulkeAdi});

  @override
  Widget build(BuildContext context) {
    // ARTIK PAHALI KOLEKSİYONA GİTMİYORUZ
    // Sadece isimlerin olduğu "Menü" belgesini çağırıyoruz.
    // Bu işlem içinde 1000 şehir de olsa sadece "1 OKUMA" yazar.
    final configRef = FirebaseFirestore.instance
        .collection('config')
        .doc('sehir_listeleri');

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 300) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF667eea),
        body: SafeArea(
          // StreamBuilder yerine FutureBuilder kullanıyoruz (Veri çok değişmediği için)
          child: FutureBuilder<DocumentSnapshot>(
            future: configRef.get(),

            // ... FutureBuilder başlangıcı aynı ...
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || !snapshot.data!.exists) {
                return const Center(child: Text("Veri bulunamadı."));
              }

              // 1. Veriyi Map olarak alıyoruz
              final data = snapshot.data!.data() as Map<String, dynamic>?;

              // 2. KRİTİK NOKTA BURASI!
              // Eğer ulkeAdi "Türkiye" ise, Firebase'deki "Türkiye" dizisini çeker.
              // Eğer "İspanya" ise "İspanya" dizisini çeker.
              final List<dynamic> hamListe = data?[ulkeAdi] ?? [];

              if (hamListe.isEmpty) {
                return const Center(
                  child: Text("Bu ülke için şehir listesi henüz eklenmemiş."),
                );
              }

              // 3. Listeyi String listesine çevir
              final List<String> sehirIsimleri = hamListe.cast<String>();

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...sehirIsimleri.map((isim) {
                      return SehirContainerGezi(sehirAdi: isim);
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
