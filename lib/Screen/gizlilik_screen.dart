import 'package:explora/Screen/screen.dart';
import 'package:flutter/material.dart';

class GizlilikScreen extends StatefulWidget {
  final Widget seciliEkran;
  const GizlilikScreen({super.key, required this.seciliEkran});

  @override
  State<GizlilikScreen> createState() => _GizlilikScreenState();
}

class _GizlilikScreenState extends State<GizlilikScreen> {
  final Map<Type, Color> ekranRenkleri = {
    GeziScreen: Color(0xFF667eea),
    DogaScreen: Color(0xFF81C784),
    YemekScreen: Color(0xFFfcb69f),
    MagazaScreen: Color(0xFF2c3e50),
    EglenceScreen: Color(0xFFff6b6b),
  };

  final items = [
    "Ad, soyad",
    "E-posta adresi",
    "Telefon numarası",
    "Konum verisi",
  ];

  @override
  Widget build(BuildContext context) {
    final screenColor = ekranRenkleri[widget.seciliEkran.runtimeType];

    // Ekranın kullanılabilir yüksekliğini hesaplayalım:
    // Toplam ekran yüksekliği - AppBar yüksekliği - SafeArea üst ve alt boşlukları
    final appBarHeight = AppBar().preferredSize.height;
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    // Container için minimum yükseklik
    final minContainerHeight =
        MediaQuery.of(context).size.height -
        appBarHeight -
        safeAreaTop -
        safeAreaBottom -
        32; // 16.0 dış padding'i (üst ve alt) çıkarıyoruz

    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        title: Text(
          'Gizlilik Politikası',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0), // Dış Padding
          // ConstrainedBox ile Container'a minimum yükseklik veriyoruz.
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  minContainerHeight, // Minimum yükseklik ekranı kaplamalı
            ),
            child: Container(
              width: double.infinity, // Tam genişlik
              // Yüksekliği ConstrainedBox belirliyor, burada tanımlamıyoruz.
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.18),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.1,
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20.0), // İçerik Padding'i
                child: Column(
                  children: [
                    // Üst Kısım
                    Column(
                      children: [
                        Text(
                          'Uygulamada tutulan verileriniz:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        // Buraya tutulan verilerle ilgili bilgi gelecek
                      ],
                    ),

                    // Alt Kısım
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          'Uygulamada tutulmayan bilgiler:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: items.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Text(
                                "• $item",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
