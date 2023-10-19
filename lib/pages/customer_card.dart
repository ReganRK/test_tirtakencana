import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_tirtakencana/pages/confirmation_gift_dialog.dart';
import 'package:test_tirtakencana/pages/gift_customer_button.dart';

class CustomerCard extends StatefulWidget {
  final String custId;
  final String name;
  final String address;
  final String phoneNo;
  final List<String> hadiah;
  final List<int> received;

  const CustomerCard({
    super.key,
    required this.custId,
    required this.name,
    required this.address,
    required this.phoneNo,
    required this.hadiah,
    required this.received,
  });

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context, 
          builder: (context) {
            return ConfirmationGiftDialog(
              idToko: widget.custId,
            );
          },
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff008375)
        ),
        child: Column(
          children: [
            const SizedBox(height: 5,),
            Row(
              children: [
                const SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    widget.name
                  ),
                ),
                Text(
                  widget.received.contains(0) ? 'Belum Diberikan' : 
                  widget.received.contains(1) ? 'Sudah Diterima' : 
                  widget.received.contains(2) ? 'Gagal Diterima' : ''
                ),
                const SizedBox(width: 10,),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 10,),
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location.svg',
                        width: 15,
                      ),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                          widget.address,
                          softWrap: true,
                        ),
                      )
                    ],
                  )
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/phone.svg',
                      width: 15,
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      widget.phoneNo,
                    )
                  ],
                ),
                const SizedBox(width: 10,),
              ],
            ),
            const SizedBox(height: 5,),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              padding: const EdgeInsets.only(top: 20.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GiftButton(
                      giftcode: widget.hadiah[index],
                      recieved: widget.received[index]
                    );
                  }, 
                  separatorBuilder: (context, index) => const SizedBox(height: 10,), 
                  itemCount: widget.hadiah.length,
                  shrinkWrap: true,
                ),
            ),
          ],
        ),
      ),
    );
  }
}