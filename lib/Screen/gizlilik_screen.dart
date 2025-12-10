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
    return Scaffold(
      backgroundColor: ekranRenkleri[widget.seciliEkran.runtimeType],
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.18),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                
                children: [
                  Text(
                    'Uygulamada tutulan verileriniz:',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text('', style: TextStyle(fontSize: 18, color: Colors.white)),

                  Text(
                    'Uygulamada tutulmayan bilgiler:',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items.map((item) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "• $item",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),

                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
