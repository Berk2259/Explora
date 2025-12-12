import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Eglence/ContainerEglence/container_eglence.dart';
import 'package:flutter/material.dart';

//Her ülkenin detay kısımları burada bulunur yani şehirlerin listelendiği ekran
class UlkeDetayScreenEglence extends StatelessWidget {
  final String ulkeAdi;
  const UlkeDetayScreenEglence({super.key, required this.ulkeAdi});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Color(0xFFff6b6b),
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
                      return SehirContainerEglence(sehirAdi: isim);
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
