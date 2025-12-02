import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Gezi/ContainerGezi/container_gezi.dart';
import 'package:flutter/material.dart';

class UlkeDetayScreenGezi extends StatelessWidget {
  final String ulkeAdi;
  const UlkeDetayScreenGezi({super.key, required this.ulkeAdi});

  @override
  Widget build(BuildContext context) {
    final sehirlerRef = FirebaseFirestore.instance.collection('sehirler');

    return Scaffold(
      backgroundColor: const Color(0xFF667eea),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: sehirlerRef.where('ulke', isEqualTo: ulkeAdi).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final sehirler = snapshot.data!.docs;

            return SingleChildScrollView(
              child: Column(
                children: [
                  ...sehirler.map((doc) {
                    final sehirAdi = doc.id;
                    return SehirContainerGezi(sehirAdi: sehirAdi);
                  }).toList(),
                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
