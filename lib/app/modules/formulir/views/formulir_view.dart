import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Formulir"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Isi Formulir",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 20),

                // Nama
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: "Nama Lengkap",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Kursus
                const Text("Pilih Kursus",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Obx(() => DropdownButtonFormField<String>(
                      value: controller.selectedCourses.value.isEmpty
                          ? null
                          : controller.selectedCourses.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.book),
                      ),
                      hint: const Text("Pilih kursus"),
                      items: controller.courses
                          .map((course) => DropdownMenuItem(
                                value: course,
                                child: Text(course),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.selectedCourses.value = value ?? '';
                      },
                    )),
                const SizedBox(height: 20),

                // Gender
                const Text("Jenis Kelamin",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Obx(() => Column(
                      children: [
                        RadioListTile<String>(
                          activeColor: Colors.blueAccent,
                          title: const Text("Laki-laki"),
                          value: "Laki-laki",
                          groupValue: controller.selectedGender.value,
                          onChanged: (value) {
                            controller.selectedGender.value = value ?? '';
                          },
                        ),
                        RadioListTile<String>(
                          activeColor: Colors.pinkAccent,
                          title: const Text("Perempuan"),
                          value: "Perempuan",
                          groupValue: controller.selectedGender.value,
                          onChanged: (value) {
                            controller.selectedGender.value = value ?? '';
                          },
                        ),
                      ],
                    )),
                const SizedBox(height: 20),

                // Tanggal Lahir
                const Text("Tanggal Lahir",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Obx(() => Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade100,
                            ),
                            child: Text(
                              controller.formattedDate,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            controller.pickDate();
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: const Text("Pilih"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 30),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.submitForm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
