import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF21CBF3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Selamat Datang 👋",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Pilih menu di bawah untuk melanjutkan",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),

                // Counter Menu
                _menuCard(
                  title: "Counter Page",
                  subtitle: "Lihat dan kelola counter kamu",
                  icon: Icons.exposure_plus_1,
                  color: Colors.orange,
                  onTap: () => Get.toNamed("/counter"),
                ),
                const SizedBox(height: 20),

                // Formulir Menu
                _menuCard(
                  title: "Formulir Page",
                  subtitle: "Isi formulir dan lihat hasilnya",
                  icon: Icons.assignment,
                  color: Colors.green,
                  onTap: () => Get.toNamed("/formulir"),
                ),
                const SizedBox(height: 20),

                // Penjualan Menu
                _menuCard(
                  title: "Penjualan Page",
                  subtitle: "Form penjualan barang sederhana",
                  icon: Icons.shopping_cart,
                  color: Colors.purple,
                  onTap: () => Get.toNamed("/penjualan"),
                ),
                const SizedBox(height: 20),

                // ✅ Post Menu
                _menuCard(
                  title: "Post Page",
                  subtitle: "Lihat daftar postingan",
                  icon: Icons.article,
                  color: Colors.blueAccent,
                  onTap: () => Get.toNamed("/post"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 20, color: color),
          ],
        ),
      ),
    );
  }
}
