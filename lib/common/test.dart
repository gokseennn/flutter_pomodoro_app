import 'dart:io';

void main() {
  print('Toplama(1)');
  print('Çıkarma(2)');

  int tercih = int.parse(stdin.readByteSync().toString());
  print('Tercihiniz : $tercih');

  print('Birinci sayiyi girin');
  int sayi1 = int.parse(stdin.readByteSync().toString());

  print('İkinci sayiyi girin');
  int sayi2 = int.parse(stdin.readByteSync().toString());

  switch (tercih) {
    case 1:
      {
        print('Toplama : ${sayi1 + sayi2}');
      }
      break;

    case 2:
      {
        print('Çıkarma : ${sayi1 - sayi2}');
      }
      break;

    default:
      {
        print('Değersiz');
      }
      break;
  }
}
