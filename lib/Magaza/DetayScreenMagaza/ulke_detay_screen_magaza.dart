import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Magaza/ContainerMagaza/container_magaza.dart';
import 'package:flutter/material.dart';

//Her ülkenin detay kısımları burada bulunur yani şehirlerin listelendiği ekran
class UlkeDetayScreenMagaza extends StatelessWidget {
  final String ulkeAdi;
  const UlkeDetayScreenMagaza({super.key, required this.ulkeAdi});

  @override
  Widget build(BuildContext context) {
    final sehirlerRef = FirebaseFirestore.instance.collection('magazasehirler');
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 300) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF2c3e50),
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
            stream: sehirlerRef
                .where('ulke', isEqualTo: ulkeAdi)
                .snapshots(), //Firestore'da şehirlerin bulunduğu koleksiyon referansı.→ ülke alanı, verilen ülke ismine eşit olan şehirleri filtreler.
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                //Stream’den henüz veri gelmediyse
                return const Center(
                  child: CircularProgressIndicator(),
                ); //kullanıcıya bir “yükleniyor” animasyonu gösterilir.
              }

              final sehirler = snapshot
                  .data!
                  .docs; //Firestore’dan dönen QuerySnapshot içindeki tüm dökümanları alır.
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...sehirler.map((doc) {
                      //Her şehir dokümanı için bir widget oluşturur.
                      final sehirAdi =
                          doc.id; //firestore'da dokümanın ID'si şehir adıdır.
                      return SehirContainerMagaza(
                        sehirAdi: sehirAdi,
                      ); //Her şehir için özel bir tasarım widget’i oluşturulur.
                    }).toList(),
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
