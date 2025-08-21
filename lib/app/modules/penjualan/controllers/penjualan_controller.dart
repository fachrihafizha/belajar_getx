import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenjualanController extends GetxController {
  // Controller untuk TextField
  final namaBarangC = TextEditingController();
  final jumlahC = TextEditingController();
  final hargaC = TextEditingController();

  // Dropdown kategori (default Makanan)
  var kategori = "Makanan".obs;

  // Hasil perhitungan
  var totalSebelumDiskon = 0.0.obs;
  var totalSetelahDiskon = 0.0.obs;

  /// Hitung total harga
  void hitungTotal() {
    final jumlah = int.tryParse(jumlahC.text) ?? 0;
    final harga = double.tryParse(hargaC.text) ?? 0;

    totalSebelumDiskon.value = jumlah * harga;

    if (totalSebelumDiskon.value >= 100000) {
      totalSetelahDiskon.value = totalSebelumDiskon.value * 0.9;
    } else {
      totalSetelahDiskon.value = totalSebelumDiskon.value;
    }
  }

  /// Reset form
  void resetForm() {
    namaBarangC.clear();
    jumlahC.clear();
    hargaC.clear();
    kategori.value = "Makanan";
    totalSebelumDiskon.value = 0.0;
    totalSetelahDiskon.value = 0.0;
  }

  @override
  void onClose() {
    // Jangan lupa dispose controller biar tidak memory leak
    namaBarangC.dispose();
    jumlahC.dispose();
    hargaC.dispose();
    super.onClose();
  }
}
