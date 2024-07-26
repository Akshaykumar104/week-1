import 'package:flutter/material.dart';
import 'package:practice/TotalPrice.dart';

class BillingPage extends StatefulWidget {
  final List<int> vegCost;
  final List<String> vegCheckList;
  final List<int> fruitsCost;
  final List<String> fruitsCheckList;

  const BillingPage({
    super.key,
    required this.vegCost,
    required this.vegCheckList,
    required this.fruitsCost,
    required this.fruitsCheckList,
  });

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    // Combine the vegetable and fruit lists
    final List<String> combinedCheckList = [...widget.vegCheckList, ...widget.fruitsCheckList];
    final List<int> combinedCostList = [...widget.vegCost, ...widget.fruitsCost];

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 100,
              right: 80,
              top: 140,
            ),
            child: Text(
              'T O T A L  C O S T',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Divider(),
          Container(
            height: 60.0 * combinedCheckList.length,
            child: ListView.builder(
              itemCount: combinedCheckList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text("${combinedCheckList[index]}"),
                      const Spacer(),
                      Text("\$${combinedCostList[index]}"),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                Text(
                  "\$ ${Totalprice().totalBill(combinedCostList)}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
