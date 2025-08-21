import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjualan_controller.dart';
import 'penjualan_view.dart';

class OutputPenjualanView extends GetView<PenjualanController> {
  const OutputPenjualanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Output Penjualan"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _infoRow(Icons.shopping_bag,
                            "Nama Barang", controller.namaBarangC.text),
                        _infoRow(Icons.category,
                            "Kategori", controller.kategori.value),
                        _infoRow(Icons.confirmation_number,
                            "Jumlah", controller.jumlahC.text),
                        _infoRow(Icons.price_check,
                            "Harga per Unit", "Rp ${controller.hargaC.text}"),
                        const Divider(height: 25, thickness: 1),
                        _highlightRow("Total Sebelum Diskon",
                            controller.totalSebelumDiskon.value.toStringAsFixed(0),
                            Colors.black87),
                        const SizedBox(height: 8),
                        _highlightRow("Total Setelah Diskon",
                            controller.totalSetelahDiskon.value.toStringAsFixed(0),
                            Colors.blueAccent),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Kembali"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[700],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.resetForm();
                          Get.offAll(() => const PenjualanView());
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text("Reset"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 22),
          const SizedBox(width: 12),
          Expanded(
              child: Text(
            "$label:",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )),
          Text(
            value,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _highlightRow(String label, String value, Color color) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          "Rp $value",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
