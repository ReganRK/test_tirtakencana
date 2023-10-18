import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String? _selectedItem = 'Item 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10.0,),
                Expanded(
                  child: DropdownButtonFormField(
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
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE74B1B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/gift.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        'Total Hadiah',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  )
                ),
                const SizedBox(width: 10.0,),
              ],
            )
          ],
        ),
      )
    );
  }
}