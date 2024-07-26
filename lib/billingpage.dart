import 'package:flutter/material.dart';

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
    required this.fruitsCheckList
  });

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ListView.builder(
              itemCount: widget.vegCheckList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text("${widget.vegCheckList[index]}"),
                      const Spacer(),
                      Text("\$${widget.vegCost[index]}"),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.fruitsCheckList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text("${widget.fruitsCheckList[index]}"),
                      const Spacer(),
                      Text("\$${widget.fruitsCost[index]}"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
