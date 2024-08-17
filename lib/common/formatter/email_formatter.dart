import 'package:flutter/services.dart';

class EmailInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Sadece e-posta adreslerinde geçerli karakterlere izin veren RegExp
    final RegExp regex = RegExp(r'[a-zA-Z0-9@._-]');

    // Yeni değerdeki her karakteri kontrol ederek, sadece geçerli olanları filtrele
    String filtered = newValue.text.split('').where((char) {
      return regex.hasMatch(char);
    }).join();

    // Filtrelenmiş değeri geri döndür
    return newValue.copyWith(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }
}
