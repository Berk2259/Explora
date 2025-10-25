//Her ülkenin container dosyası aynı şekilde oluşturulacak. Sadece içeriği değişecek.
import 'package:explora/DetayScreen/ulke_detay_screen.dart';
import 'package:flutter/material.dart';

class UlkeContainer extends StatelessWidget {
  final String ulkeAdi;
  final String iconUlke;
  final Color ButtonColor1;
  final Color ButtonColor2;
  const UlkeContainer({
    super.key,
    required this.ulkeAdi,
    required this.iconUlke,
    required this.ButtonColor1,
    required this.ButtonColor2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UlkeDetayScreen(ulkeAdi: ulkeAdi,)),
          );
        },
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(iconUlke),
              ),
              Text(
                ulkeAdi,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [ButtonColor1, ButtonColor2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      
                    ).createShader(bounds);
                  },
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UlkeDetayScreen(ulkeAdi: ulkeAdi,)),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_circle_right,
                      size: 40,
                      color: Colors.white, // Gradient çalışsın diye beyaz bırak
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
