import 'package:explora/Screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UygulamaHakkindaScreen extends StatefulWidget {
  final Widget seciliEkran;
  const UygulamaHakkindaScreen({super.key, required this.seciliEkran});

  @override
  State<UygulamaHakkindaScreen> createState() => _UygulamaHakkindaScreenState();
}

class _UygulamaHakkindaScreenState extends State<UygulamaHakkindaScreen> {
  final Map<Type, Color> ekranRenkleri = {
    GeziScreen: Color(0xFF667eea),
    DogaScreen: Color(0xFF81C784),
    YemekScreen: Color(0xFFfcb69f),
    MagazaScreen: Color(0xFF2c3e50),
    EglenceScreen: Color(0xFFff6b6b),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ekranRenkleri[widget.seciliEkran.runtimeType],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/newlogo.png'),
              radius: 70,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.18),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.1,
                ),
              ),
              child: Center(
                child: Text(
                  'Explora',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Uygulamadaki Ana Sayfalar',
                        style: TextStyle(
                          color: Color(0xFF083460),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          hakkinda_alt_part(
                            icon: Icons.account_balance,
                            title: 'Tarihi Yerler',
                            description:
                                'Bu kısımdan her ülkedeki tarihi yerleri görebilirsiniz',
                          ),
                          hakkinda_alt_part(
                            icon: Icons.park,
                            title: 'Doğal Yerler',
                            description:
                                'Bu kısımdan her ülkedeki doğal yerleri görebilirsiniz',
                          ),
                          hakkinda_alt_part(
                            icon: Icons.fastfood,
                            title: 'Yemek Yerleri',
                            description:
                                'Bu kısımdan her ülkedeki yemek yerleri görebilirsiniz',
                          ),
                          hakkinda_alt_part(
                            icon: FontAwesomeIcons.bagShopping,
                            title: 'Mağazalar',
                            description:
                                'Bu kısımdan her ülkedeki mağazaları görebilirsiniz',
                          ),
                          hakkinda_alt_part(
                            icon: Icons.celebration,
                            title: 'Eğlence Yerleri',
                            description:
                                'Bu kısımdan her ülkedeki eğlence yerleri görebilirsiniz',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Uygulamada Neler Yapabilirsiniz',
                        style: TextStyle(
                          color: Color(0xFF083460),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Uygulamada istediğiniz şehre ait istediğiniz türde mekanın konumunu görüntülüyebilirsiniz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Uygulamadaki Kaynaklar',
                        style: TextStyle(
                          color: Color(0xFF083460),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Uygulamadaki görsel öğeler aşağıdaki kaynaklardan kullanılmıştır:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '• https://www.flaticon.com/',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '• https://fontawesome.com/',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class hakkinda_alt_part extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const hakkinda_alt_part({
    required this.icon,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white)),
                Text(
                  description,
                  style: TextStyle(color: Colors.white, fontSize: 12,),
                
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
