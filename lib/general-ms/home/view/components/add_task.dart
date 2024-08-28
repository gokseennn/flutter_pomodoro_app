import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_controller.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20.0), // Kenarları daha yumuşak hale getirdik
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // Font boyutunu biraz büyüttük
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: controller.taskTextEditingController,
              decoration: InputDecoration(
                hintText: 'Enter a Task',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Kenarları daha yumuşak
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 16.0), // İçerik aralığını artırdık
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Date & Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // Font boyutunu biraz büyüttük
              ),
            ),
            const SizedBox(height: 10.0),
            Obx(() => InkWell(
                  onTap: () async {
                    await controller.selectDateTime(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors
                          .grey[100], // Arka planı biraz daha yumuşak yaptık
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius:
                          BorderRadius.circular(12.0), // Kenarları daha yumuşak
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('EEE, MMM d, yyyy - h:mm a')
                              .format(controller.selectedDateTime.value),
                          style: TextStyle(
                            color: Colors.grey[700], // Metin rengi daha yumuşak
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back(); // Close the dialog
                  },
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors
                          .redAccent, // CANCEL butonunu kırmızı renkte yaptık
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await controller.addNewHabit(); // Add new habit logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.grey[800], // ADD butonunu mavi renkte yaptık
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12.0), // Buton kenarlarını yuvarladık
                    ),
                  ),
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                        fontSize: 16.0, // Font boyutunu artırdık
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
