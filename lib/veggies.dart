import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice/TotalPrice.dart';
import 'package:practice/fruits.dart';
import 'package:practice/homepage.dart';

class Veggies extends StatefulWidget {
  const Veggies({super.key});

  @override
  State<Veggies> createState() => _VeggiesState();
}

class _VeggiesState extends State<Veggies> {
  // Create a list to store the checked state of each checkbox
  List<bool> isCheckedList = List.generate(veggies.length, (index) => false);

  // List of vegetables
  static const List<String> veggies = [
    'potato',
    'tomato',
    'carrot',
    'garlic',
    'cauliflower',
  ];
  static const List<int> cost= [
   50,123,45,34,90
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Center(child: Text("V E G E T A B L E S")),
      ),
      body: ListView.builder(
        itemCount: veggies.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: isCheckedList[index],
            title: Row(
              children: [
                Text("${veggies[index]}            "),
                const Spacer(),
                Text("\$ ${cost[index]}")
              ],

            ),
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[index] = newValue ?? false;
              });
              log("hghg  ${isCheckedList}");
            },
            activeColor: Colors.deepPurple[300],
            checkColor: Colors.white,
          );
        }

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
                List<String> selectedVeg=[];
                List<int> selectedVegCost=[];
                for(int i =0 ;i < isCheckedList.length; i++) {
                  if (isCheckedList[i] == true) {
                   selectedVeg.add(veggies[i]);
                   selectedVegCost.add(cost[i]);
                  }
                }
               // Totalprice().add1(isCheckedList, cost);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Fruits(vegCost: selectedVegCost, vegCheckList: selectedVeg,),),);
              },
              child: const Text("              N  E  X  T              "),
            )

          ],
        ),
      ),

    );
  }
}
