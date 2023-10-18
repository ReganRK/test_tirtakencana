import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Mandiri Lampung'
              ),
            ),
            Text(
              'Belum Diberikan'
            )
          ],
        )
      ],
    );
  }
}