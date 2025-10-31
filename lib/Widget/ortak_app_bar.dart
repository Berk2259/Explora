import 'package:flutter/material.dart';

class OrtakAppBar extends StatelessWidget {
  final String title;
  final Widget body;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  OrtakAppBar({required this.title, required this.body, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      key: _scaffoldKey, // <-- Scaffold key ekledik
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        toolbarHeight: 40,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/logo.png',
                  ), // Arka plan olarak kullanacağın görsel
                  fit: BoxFit.cover, // Arka plan resmi tüm alanı kaplasın
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft, // Başlığı alt sola hizala
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
            ListTile(
              leading: Icon(Icons.home,color: Colors.blue.shade900,),
              title: Text('Uygulama Hakkında',style: TextStyle(color: Colors.blue.shade900,),),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.mail,color: Colors.blue.shade900,),
              title: Text('İletişim',style: TextStyle(color: Colors.blue.shade900,),),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
