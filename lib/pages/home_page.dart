import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_tirtakencana/models/customer.dart';
import 'package:test_tirtakencana/pages/customer_card.dart';
import 'package:test_tirtakencana/pages/total_gift_dialog.dart';
import 'package:test_tirtakencana/providers/customer_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<String> items = [];
  String? _selectedItem = '';

  List<Customer> customers = [];

  bool isLoading = false;

  Future<void> refreshData() async{
    setState(() {
      isLoading = true;
    });

    final result = await CustomerProvider().getAll();

    customers = result.data;

    for (var customer in customers) {
      items.add(customer.name);
    }

    _selectedItem = items[0];

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10,),
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
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return const TotalGiftDialog();
                      },
                    );
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
            isLoading ? Center(
              child: CircularProgressIndicator(),
            ) :
            customerList(),
          ],
        ),
      )
    );
  }

  Expanded customerList() {
    return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return CustomerCard(
                  custId: customers[index].id,
                  address: customers[index].address,
                  hadiah: customers[index].hadiah,
                  name: customers[index].name,
                  phoneNo: customers[index].phoneno,
                  received: customers[index].received,
                );
              }, 
              separatorBuilder: (context, index) => const SizedBox(height: 20), 
              itemCount: customers.length,
            ),
          );
  }
}