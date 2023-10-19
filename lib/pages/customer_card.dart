import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomerCard extends StatefulWidget {
  final String custId;
  final String name;
  final String address;
  final String phoneNo;
  final List<String> hadiah;

  const CustomerCard({
    super.key,
    required this.custId,
    required this.name,
    required this.address,
    required this.phoneNo,
    required this.hadiah,
  });

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff008375)
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10,),
              Expanded(
                child: Text(
                  'Mandiri Lampung'
                ),
              ),
              Text(
                'Belum Diberikan'
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
                    SizedBox(width: 5,),
                    Text(
                      'Alamat',
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
                  SizedBox(width: 5,),
                  Text(
                    'No telp',
                  )
                ],
              ),
              const SizedBox(width: 10,),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            padding: const EdgeInsets.only(top: 20.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff21A49C),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/giftbox.png',
                            width: 25,
                          ),
                          Text(
                            'Kode disini nanti',
                          )
                        ],
                      )
                    ),
                  );
                }, 
                separatorBuilder: (context, index) => const SizedBox(height: 10,), 
                itemCount: 3,
                shrinkWrap: true,
              ),
          ),
        ],
      ),
    );
  }
}