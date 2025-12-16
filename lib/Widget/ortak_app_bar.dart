import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explora/Screen/gizlilik_screen.dart';
import 'package:explora/Screen/screen.dart';
import 'package:explora/Widget/pop_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class OrtakAppBar extends StatefulWidget {
  final String title;
  final Widget body;
  final Color? appBarColor;
  final Widget seciliEkran;

  OrtakAppBar({
    required this.title,
    required this.body,
    this.appBarColor,
    required this.seciliEkran,
    Key? key,
  }) : super(key: key);

  @override
  State<OrtakAppBar> createState() => _OrtakAppBarState();
}

class _OrtakAppBarState extends State<OrtakAppBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Ekrana göre Drawer rengi
  final Map<Type, Color> ekranRenkleri = {
    GeziScreen: Color(0xFF667eea),
    DogaScreen: Color(0xFF81C784),
    YemekScreen: Color(0xFFfcb69f),
    MagazaScreen: Color(0xFF2c3e50),
    EglenceScreen: Color(0xFFff6b6b),
  };
  Future<String?> getContactEmail() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('config')
          .doc('contact')
          .get();
      if (doc.exists) {
        return doc.get('email') as String;
      }
      return null;
    } catch (e) {
      print('Hata: $e');
      return null;
    }
  }

  void mailGonder(String email, {String subject = '', String body = ''}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'E-posta gönderilemiyor: $emailUri';
    }
  }

  //websitesine yönlendirme fonksiyonu
  Future<void> _openWebsite(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Website açılamadı!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultColor = widget.appBarColor ?? Colors.blue.shade900;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: defaultColor,
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: defaultColor,
        centerTitle: true,
        toolbarHeight: 40,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(Icons.menu, color: Colors.white),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Üst scrollable alan
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 280,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/newlogo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Explora',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Menü öğeleri
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ekranRenkleri[widget.seciliEkran.runtimeType],
                        ),
                        child: ListTile(
                          leading: Icon(Icons.info, color: Colors.white),
                          title: Text(
                            'Uygulama Hakkında',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UygulamaHakkindaScreen(
                                seciliEkran: widget.seciliEkran,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ekranRenkleri[widget.seciliEkran.runtimeType],
                        ),
                        child: FutureBuilder<String?>(
                          future: getContactEmail(), // Firebase'den maili çek
                          builder: (context, snapshot) {
                            return ListTile(
                              leading: const Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                              title: const Text(
                                'İletişim',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap:
                                  snapshot.hasData && snapshot.data!.isNotEmpty
                                  ? () {
                                      mailGonder(
                                        snapshot.data!,
                                        subject: 'Merhaba',
                                        body: 'Bir Konuda Fikrim Var',
                                      );
                                    }
                                  : null, // mail yoksa tıklanamaz
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ekranRenkleri[widget.seciliEkran.runtimeType],
                        ),
                        child: ListTile(
                          leading: Icon(Icons.shield, color: Colors.white),
                          title: Text(
                            'Gizlilik Politikası',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GizlilikScreen(
                                seciliEkran: widget.seciliEkran,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ekranRenkleri[widget.seciliEkran.runtimeType],
                        ),
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app, color: Colors.white),
                          title: Text(
                            'Çıkış Yap',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            PopUp.show(
                              context: context,
                              title: 'Uyarı',
                              message:
                                  'Çıkış yapmak istediğinize emin misiniz?',
                            );
                          },
                        ),
                      ),
                    ),
                    /* Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ekranRenkleri[widget.seciliEkran.runtimeType],
                        ),
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.palette,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Tercihler',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ), */
                  ],
                ),
              ),
            ),

            // Alt öğeler (sosyal ikonlar) sabit
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _openWebsite('https://www.instagram.com/explora_app_');
                    },
                    icon: Icon(FontAwesomeIcons.squareInstagram, size: 40),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      _openWebsite(
                        'https://www.facebook.com/profile.php?id=61585383622736',
                      );
                    },
                    icon: Icon(FontAwesomeIcons.facebook, size: 35),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      _openWebsite('https://x.com/Explora_0');
                    },
                    icon: Icon(FontAwesomeIcons.xTwitter, size: 35),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Uygulamada konumla ilgili sorunlar olabilir uygulamayı kullanırken bu durumu göz önünde bulundurun',
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: widget.body,
    );
  }
}
