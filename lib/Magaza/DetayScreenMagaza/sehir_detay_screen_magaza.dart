import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Magaza/ContainerMagaza/container_magaza.dart';
import 'package:flutter/material.dart';

//Mekan kısımları yani şehirlerin detay kısımları burada bulunur
class SehirDetayScreenMagaza extends StatelessWidget {
  final String sehirAdi;

  const SehirDetayScreenMagaza({super.key, required this.sehirAdi});

  @override
  Widget build(BuildContext context) {
    final docRef = FirebaseFirestore.instance
        .collection('magazasehirler')
        .doc(
          sehirAdi,
        ); //bu satır firestoredaki sehirler koleksiyonundan sehirAdi Id'li belgeye ulaşmayı sağlar
    return Scaffold(
      backgroundColor: Color(0xFF2c3e50),
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 300) {
              Navigator.of(context).pop();
            }
          },
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
                      (mekan) => MekanContainerMagaza(
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
