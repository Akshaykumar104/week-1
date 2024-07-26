import 'package:flutter/material.dart';
import 'package:practice/billingpage.dart';

import 'TotalPrice.dart';
import 'homepage.dart';
class Fruits extends StatefulWidget {
  final List<int> vegCost;
  final List<String> vegCheckList;
  const Fruits({super.key, required this.vegCost, required this.vegCheckList});

  @override
  State<Fruits> createState() => _FruitsState();
}
// List of vegetables
 const List<String> fruites = [
  'A',
  'B',
  'C',
  'D',
  'E',
];

class _FruitsState extends State<Fruits> {
  List<bool> isCheckedListfruits = List.generate(fruites.length, (index) => false);
  static const List<String> fruites = [
    'A',
    'B',
    'C',
    'D',
    'E',
  ];
  static const List<int> cost= [
    10,12,3,4,4
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Center(child: Text("F  R  U  I  T  S")),
      ),
      body: ListView.builder(
        itemCount: fruites.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: isCheckedListfruits[index],
            title: Row(
              children: [
                Text("${fruites[index]}            "),
                const Spacer(),
                Text("\$ ${cost[index]}")
              ],

            ),
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedListfruits[index] = newValue ?? false;
              });
            },
            activeColor: Colors.deepPurple[300],
            checkColor: Colors.white,
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage(),),);
              },
              child: const Text("         C A N C E L         "),
            ),
            const Spacer(),
            TextButton(
              onPressed: (){
                List<String> selectedFruit=[];
                List<int> selectedFruitCost=[];
                for(int i =0 ;i < isCheckedListfruits.length; i++) {
                  if (isCheckedListfruits[i] == true) {
                    selectedFruit.add(fruites[i]);
                    selectedFruitCost.add(cost[i]);
                  }
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Billingpage(vegCost: widget.vegCost, vegCheckList: widget.vegCheckList, fruitsCost: selectedFruitCost, fruitsCheckList: selectedFruit,),),);
              },
              child: const Text("              N  E  X  T              "),
            )

          ],
        ),
      ),

    );
  }
}
