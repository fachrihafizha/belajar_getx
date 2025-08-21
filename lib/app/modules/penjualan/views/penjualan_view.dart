import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjualan_controller.dart';
import 'output_penjualan_view.dart';

class PenjualanView extends GetView<PenjualanController> {
  const PenjualanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          '🛒 Form Penjualan Barang',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 6,
          shadowColor: Colors.blue.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Judul Form
                const Text(
                  "Isi Data Penjualan",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 20),

                // Nama Barang
                TextField(
                  controller: controller.namaBarangC,
                  decoration: InputDecoration(
                    labelText: "Nama Barang",
                    prefixIcon: const Icon(Icons.shopping_bag),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Jumlah
                TextField(
                  controller: controller.jumlahC,
                  decoration: InputDecoration(
                    labelText: "Jumlah",
                    prefixIcon: const Icon(Icons.numbers),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                // Harga per unit
                TextField(
                  controller: controller.hargaC,
                  decoration: InputDecoration(
                    labelText: "Harga per Unit",
                    prefixIcon: const Icon(Icons.price_change),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                // Dropdown kategori
                Obx(() => DropdownButtonFormField<String>(
                      value: controller.kategori.value,
                      items: const [
                        DropdownMenuItem(
                            value: "Makanan", child: Text("Makanan")),
                        DropdownMenuItem(
                            value: "Minuman", child: Text("Minuman")),
                        DropdownMenuItem(
                            value: "Alat Tulis", child: Text("Alat Tulis")),
                      ],
                      onChanged: (value) {
                        controller.kategori.value = value!;
                      },
                      decoration: InputDecoration(
                        labelText: "Kategori Barang",
                        prefixIcon: const Icon(Icons.category),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )),
                const SizedBox(height: 30),

                // Tombol Hitung
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      controller.hitungTotal();
                      Get.to(() => const OutputPenjualanView());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                    ),
                    icon: const Icon(Icons.calculate, size: 24),
                    label: const Text(
                      "Hitung & Lihat Hasil",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
