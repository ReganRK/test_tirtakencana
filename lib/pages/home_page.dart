import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_tirtakencana/models/customer.dart';
import 'package:test_tirtakencana/pages/customer_card.dart';
import 'package:test_tirtakencana/providers/customer_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String? _selectedItem = 'Item 1';  

  List<Customer> customers = [];

  bool isLoading = false;

  Future<void> refreshData() async{
    setState(() {
      isLoading = true;
    });

    final result = await CustomerProvider().getAll();

    customers = result.data;

    setState(() {
      isLoading = false;
    });
  }

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
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return CustomerCard(
                    custId: customers[index].id,
                    address: customers[index].address,
                    hadiah: customers[index].hadiah,
                    name: customers[index].name,
                    phoneNo: customers[index].phoneno,
                  );
                }, 
                separatorBuilder: (context, index) => const SizedBox(height: 20), 
                itemCount: customers.length,
              ),
            ),
          ],
        ),
      )
    );
  }
  
  getLoadingUI() {

  }
  
  getErrorUI(String error) {

  }

  getListView(Customer customer) {

  }
}