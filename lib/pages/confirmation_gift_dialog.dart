import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_tirtakencana/providers/customer_provider.dart';

class ConfirmationGiftDialog extends StatefulWidget {
  final String idToko;
  const ConfirmationGiftDialog({
    super.key,
    required this.idToko
  });

  @override
  State<ConfirmationGiftDialog> createState() => _ConfirmationGiftDialogState();
}

class _ConfirmationGiftDialogState extends State<ConfirmationGiftDialog> {

  //*1 = gagal dikirim
  //*0 = kembali ke awal

  int state = 0;

  List<String> items = ['Pilih Alasan', 'Toko Tutup', 'Pemilik Toko Tidak Ada'];
  String? _selectedItem = 'Pilih Alasan';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // child: state == 0 ? giftConfirmation(context) :
      child: state == 0 ? giftConfirmation(context) : giftConfirmationFailToFinish(),
    );
  }

  Future<void> fail(String alasan, String id) async{
    print(alasan);
    print(id);
    await CustomerProvider().updateFail(alasan, id);
  }

  Future<void> success(String tanggal, String id) async{
    print(tanggal);
    print(id);
    await CustomerProvider().updateSuccess(tanggal, id);
  }

  Container giftConfirmationFailToFinish() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Gagal Terima TTH'
          ),
          const SizedBox(height: 10,),
          DropdownButtonFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(width: 3, color: Colors.green),
              ),
            ),
            value: _selectedItem,
            items: items
              .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/home.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      item
                    )
                  ],
                )
              ),
              ).toList(), 
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    state = 0;
                  });
                }, 
                child: Text(
                  'BATAL',
                )
              ),
              ElevatedButton(
                onPressed: () {
                  fail(_selectedItem!, widget.idToko);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'SIMPAN',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),  
    );
  }

  Container giftConfirmation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sudah Terima TTH?',
          ),
          SvgPicture.asset(
            'assets/icons/question.svg',
            width: 250,
          ),
          Text(
            'Yakin ingin menyimpan sudah terima TTH?',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    state = 1;
                  });
                }, 
                child: Text(
                  'TIDAK',
                )
              ),
              ElevatedButton(
                onPressed: () {
                  DateTime now = DateTime.now();
                  DateTime date = DateTime(now.year, now.month, now.day);
                  String tanggal = date.toString();
                  success(tanggal, widget.idToko);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'YA, SUDAH TERIMA',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}