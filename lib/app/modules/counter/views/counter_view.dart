import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CounterView'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Angka + Font Size Dinamis
            Obx(
              () => Text(
                controller.count.value.toString(),
                style: TextStyle(
                  fontSize: 20.0 + controller.count.value.toDouble(), 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol sejajar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () => controller.increment(),
                  child: const Text('Tambah'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () => controller.decrement(),
                  child: const Text('Kurang'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
