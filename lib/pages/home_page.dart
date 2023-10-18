import 'package:flutter/material.dart';

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
                Expanded(
                  child: DropdownButton(
                    value: _selectedItem,
                    items: items
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item
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
                ElevatedButton(
                  onPressed: () {
                    
                  }, 
                  child: Text(
                    'Total Hadiah'
                  )
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}