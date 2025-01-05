import 'package:flutter/material.dart';
import 'package:monizo_app/core/theme/colors.dart';
import 'package:monizo_app/presentation/widgets/home_page/header_curve_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true, // AppBar'ın arkasını genişlet
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Şeffaf yap
        elevation: 0, // Gölgeyi kaldır
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white), // Başlık rengi
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Bildirim aksiyonu
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const HeaderCurveContainer(), // Header'ın tasarımı burada
          Expanded(
            child: Container(
              color: Colors.white, // Ana ekranın arka planı
              child: const Center(
                child: Text("Body Content"), // İçerik
              ),
            ),
          ),
        ],
      ),
    );
  }
}
