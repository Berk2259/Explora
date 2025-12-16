import 'package:explora/Screen/screen.dart';
import 'package:explora/Service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? errorMessage;
  bool isLogin = true;
  bool isLoading = false;

  Future<void> signIn() async {
    setState(() => isLoading = true);
    try {
      UserCredential user = await Auth().signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('✅ Giriş Başarılı: ${user.user?.email}');
      navigateHome();
    } on FirebaseAuthException catch (e) {
      print('❌ Firebase Error: ${e.code} -> ${e.message}');
      setState(() => errorMessage = e.message ?? e.code);
    } catch (e) {
      print('❌ Beklenmeyen Hata: $e');
      setState(() => errorMessage = e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  void navigateHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/icons/newlogo.png'),
                ),
                SizedBox(height: 20),
                Text(
                  'Explora',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  validator:
                      (value) => //email boş olamaz kontrolü
                          value!.isEmpty ? "Email boş olamaz" : null,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF334155),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),

                SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) =>
                      value!.length <
                          6 //şifrenin 6 karakterden az olmaması kontrolü
                      ? "Şifre en az 6 karakter olmalı"
                      : null,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Color(0xFF334155),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 12),
                if (errorMessage != null)
                  Text(
                    'Email veya Şifre Yanlış',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                SizedBox(height: 20),
                isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //email ve şifre doğru formatta mı kontrol eder
                            if (isLogin) {
                              //eğer giriş modundaysak
                              signIn(); //signIn fonksiyonu çalışsın
                            }
                          }
                        },
                        child: Text(
                          'Giriş',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Henüz Hesabınız yok mu? Kayıt Ol',
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
    );
  }
}
