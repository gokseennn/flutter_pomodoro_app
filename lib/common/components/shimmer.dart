import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double itemHeight = constraints.maxHeight / 5; // 5 dikdörtgenli liste
        return ListView.builder(
          itemCount: 5, // Listeye eklemek istediğiniz dikdörtgen sayısı
          itemBuilder: (context, index) {
            return Shimmer(
              gradient: LinearGradient(
                colors: [Colors.grey[400]!, Colors.grey[100]!],
                stops: const [0.0, 1.0],
                begin: const Alignment(-1.0, 0.0),
                end: const Alignment(1.0, 0.0),
              ),
              period: const Duration(seconds: 2), // Shimmer animasyon süresi
              child: ShimmerItem(itemHeight: itemHeight),
            );
          },
        );
      },
    );
  }
}

class ShimmerItem extends StatelessWidget {
  final double itemHeight;

  const ShimmerItem({super.key, required this.itemHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: MediaQuery.of(context).size.width, // Ekran genişliği kadar
      height: itemHeight, // Ekran yüksekliğine göre orantılı yükseklik
      color: Colors.grey,
    );
  }
}
