import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_tirtakencana/models/totalhadiah.dart';
import 'package:test_tirtakencana/providers/totalhadiah_provider.dart';

class TotalGiftDialog extends StatefulWidget {
  const TotalGiftDialog({super.key});

  @override
  State<TotalGiftDialog> createState() => _TotalGiftDialogState();
}

class _TotalGiftDialogState extends State<TotalGiftDialog> {
  List<Hadiah> hadiahs = [];
  int total = 0;

  bool isLoading = false;

  Future<void> refreshData() async{
    setState(() {
      isLoading = true;
    });

    final result = await TotalHadiahProvider().getAll();

    hadiahs = result.data;

    for (var hadiah in hadiahs) {
      total = total + int.parse(hadiah.qty);
    }

    print(total);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/giftbox.png',
                  width: 50,
                ),
                Expanded(
                  child: Text(
                    'Total Hadiah'
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, 
                  icon: SvgPicture.asset(
                    'assets/icons/close.svg'
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              constraints: BoxConstraints(
                maxHeight: 280,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffE74B1B),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/gift.svg',
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                          hadiahs[index].jenis
                        ),
                      ),
                      Text(
                        hadiahs[index].qty.toString() + ' ' + hadiahs[index].unit.toString()
                      )
                    ],
                  );
                }, 
                separatorBuilder: (context, index) => const SizedBox(height: 20), 
                itemCount: hadiahs.length
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$total Hadiah'
                )
              ],
            )
          ],
        ),
      )
      //* giftConfirmation(context)
    );
  }
}