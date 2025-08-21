import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../views/formulir_output_view.dart';

class FormulirController extends GetxController {
  final nameController = TextEditingController();

  // List kursus
  List<String> courses = ['flutter', 'dart', 'java', 'python'];

  // Reactive variabel
  final selectedCourses = ''.obs;
  final selectedGender = ''.obs;
  final selectedDate = DateTime.now().obs;

  // Getter untuk format tanggal
  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(selectedDate.value);

  // Fungsi pilih tanggal
  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  // Fungsi submit -> pindah halaman dengan membawa data
  void submitForm() {
    Get.to(() => FormulirOutputView(
          nama: nameController.text,
          kursus: selectedCourses.value,
          gender: selectedGender.value,
          tanggal: formattedDate,
        ));
  }
}
