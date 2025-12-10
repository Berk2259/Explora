import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Gezi/ContainerGezi/mekan_container_gezi.dart';
import 'package:flutter/material.dart';

//mekanlar burada listelenir
class SehirDetayScreenGezi extends StatelessWidget {
  final String sehirAdi;
  const SehirDetayScreenGezi({super.key, required this.sehirAdi});

  @override
  Widget build(BuildContext context) {
    final docRef = FirebaseFirestore.instance
        .collection('gezisehirler')
        .doc(
          sehirAdi,
        ); //bu satır firestoredaki sehirler koleksiyonundan sehirAdi Id'li belgeye ulaşmayı sağlar

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 300) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF667eea),
        body: SafeArea(
          child: FutureBuilder<DocumentSnapshot>(
            future: docRef.get(), //firestoredan belgeyi alır
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                //Future henüz sonuçlanmadıysa
                return const Center(
                  child: CircularProgressIndicator(),
                ); //yükleniyor animasyonu gösterilir
              }

              if (!snapshot.hasData || snapshot.data == null) {
                //Future tamamlandı ama sonuç yoksa Örneğin internet kesildiğinde veya Firestore yanlış referans verildiğinde olabilir.
                return const Center(
                  child: Text("Veri bulunamadı."),
                ); //kullanıcıya hata mesajı gösterilir.
              }

              if (!snapshot.data!.exists) {
                //Firestore’da istenen doküman bulunamadıysa
                return const Center(
                  child: Text("Bu şehir için doküman bulunamadı."),
                );
              }

              final data =
                  snapshot.data!.data()
                      as Map<
                        String,
                        dynamic
                      >?; //Dokümandan gelen veriyi alır. Firestore dokümanları Map<String, dynamic> formatındadır.

              if (data == null || data['mekanlar'] == null) {
                //Doküman var ama içinde mekanlar alanı yoksa, kullanıcıya mekan olmadığı mesajı gösterilir.
                return const Center(
                  child: Text("Bu şehir için mekan bilgisi bulunamadı."),
                );
              }

              final mekanlar = List<Map<String, dynamic>>.from(
                //mekanlar alanı bir liste olduğu için, bu satır listeyi List<Map<String, dynamic>> formatına dönüştürür.
                data['mekanlar'], //Yani her mekan bir map olarak okunur.
              );

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...mekanlar.map(
                      //mekanlar listesindeki her elemanı map’layıp bir widget’a dönüştürüyor.
                      (mekan) => MekanContainerGezi(
                        mekan: mekan,
                      ), //Her mekan için MekanContainerGezi widget’i oluşturuluyor.
                    ),
                    const SizedBox(height: 20),
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
