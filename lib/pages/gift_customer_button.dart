import 'package:flutter/material.dart';

class GiftButton extends StatelessWidget {
  final String giftcode;
  final int recieved;
  const GiftButton({
    super.key,
    required this.giftcode,
    required this.recieved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: listGift(),
    );
  }

  Container listGift() {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xff21A49C),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/giftbox.png',
            width: 25,
          ),
          const SizedBox(width: 10,),
          Text(
            giftcode,
          )
        ],
      )
    );
  }
}