import 'package:explora/Screen/gizlilik_screen.dart';
import 'package:explora/Screen/screen.dart';
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
                    DrawerHeader(
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
                              builder: (context) => UygulamaHakkindaScreen(seciliEkran:  widget.seciliEkran,),
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
                          leading: Icon(Icons.mail, color: Colors.white),
                          title: Text(
                            'İletişim',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            mailGonder(
                              'example@mail.com',
                              subject: 'Merhaba',
                              body: 'Bir Konuda Fikrim Var',
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
                              builder: (context) => GizlilikScreen(seciliEkran:  widget.seciliEkran,),
                            ),
                          ),
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
                      _openWebsite('https://www.instagram.com');
                    },
                    icon: Icon(FontAwesomeIcons.instagram, size: 40),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      _openWebsite('https://www.facebook.com');
                    },
                    icon: Icon(FontAwesomeIcons.facebook, size: 35),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      _openWebsite('https://x.com');
                    },
                    icon: Icon(FontAwesomeIcons.xTwitter, size: 35),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: widget.body,
    );
  }
}
