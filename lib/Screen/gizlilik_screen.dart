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
        centerTitle: true,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bu Gizlilik Politikası, Explora tarafından toplanan, kullanılan ve korunan kişisel verilerle ilgili esasları açıklamaktadır. Uygulamayı kullanarak bu Gizlilik Politikası’nı kabul etmiş olursunuz.',
                    ),
                    SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1. Toplanan Bilgiler',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Uygulama hiçbir kişisel veri toplamamaktadır.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              ' • Kullanıcıdan ad, e-posta, konum, cihaz kimliği veya benzeri herhangi bir kişisel bilgi talep edilmez.',
                            ),
                            Text(
                              ' • Uygulama içi analiz, reklam, izleme veya üçüncü taraf veri toplama araçları kullanılmamaktadır.',
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2. İzinler',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Explora, kullanıcıdan özel bir sistem izni talep etmez.',
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '3. Veri Paylaşımı',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Uygulama herhangi bir veri toplamadığı için üçüncü kişilerle veri paylaşımı söz konusu değildir.',
                            ),
                          ],
                        ),
                         SizedBox(height: 15),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '4. Veri Güvenliği',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Herhangi bir kişisel veri işlenmediğinden, veri güvenliği riski bulunmamaktadır.',
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '5. Çocukların Gizliliği',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Explora, 13 yaşın altındaki çocuklardan bilerek kişisel veri toplamaz. Zaten uygulama genel olarak veri toplama işlevi içermemektedir.',
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '6. Gizlilik Politikası Değişiklikleri',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Bu Gizlilik Politikası gerekli görüldüğünde güncellenebilir. Güncellemeler uygulama üzerinden veya uygulama mağazası sayfasında yayımlandığı anda yürürlüğe girer.',
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '7. İletişim',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Gizlilik Politikası ile ilgili sorular için bizimle iletişim kısmından iletişime geçebilirsiniz')
                            
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text('Son Güncelleme Tarihi: 16.12.2025',style: TextStyle(fontWeight: FontWeight.bold),)
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
