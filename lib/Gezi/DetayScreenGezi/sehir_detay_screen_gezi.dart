import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Gezi/ContainerGezi/mekan_container_gezi.dart';
import 'package:flutter/material.dart';

class SehirDetayScreenGezi extends StatelessWidget {
  final String sehirAdi;
  const SehirDetayScreenGezi({super.key, required this.sehirAdi});

  @override
  Widget build(BuildContext context) {
    final docRef =
        FirebaseFirestore.instance.collection('sehirler').doc(sehirAdi); //bu satır firestoredaki sehirler koleksiyonundan sehirAdi Id'li belgeye ulaşmayı sağlar

    return Scaffold(
      backgroundColor: const Color(0xFF667eea),
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 300) {
              Navigator.of(context).pop();
            }
          },
          child: FutureBuilder<DocumentSnapshot>(
            future: docRef.get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text("Veri bulunamadı."));
              }

              if (!snapshot.data!.exists) {
                return const Center(child: Text("Bu şehir için doküman bulunamadı."));
              }

              final data = snapshot.data!.data() as Map<String, dynamic>?;

              if (data == null || data['mekanlar'] == null) {
                return const Center(child: Text("Bu şehir için mekan bilgisi bulunamadı."));
              }

              final mekanlar = List<Map<String, dynamic>>.from(data['mekanlar']);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...mekanlar.map(
                      (mekan) => MekanContainerGezi(mekan: mekan),
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
