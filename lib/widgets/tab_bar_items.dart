import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/food_model.dart';
import '../view/details_page.dart';

class TabBarItem extends StatelessWidget {
  List<FoodModel>itemList;
 TabBarItem({Key? key,required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 10,
           crossAxisSpacing: 10,
          childAspectRatio: 0.73
        ),
        itemCount: itemList.length,
        itemBuilder: (context, index) =>InkWell(
          splashColor: Colors.white,
     onTap: ()=>Get.to(const DetailsPage(),arguments: itemList[index]),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            //margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF232227),
              boxShadow:[
                BoxShadow(
                  color: Colors.black.withOpacity(.4),
                  blurRadius: 8,
                  spreadRadius: 1

                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(itemList[index].url,height: 140,width: 150,fit: BoxFit.cover,)),
                const SizedBox(height: 5,),
                 Text('Cheese ${itemList[index].name}',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                const SizedBox(height: 3,),
               Text('Hot ${itemList[index].name}',style: const TextStyle(color: Colors.white54,fontWeight: FontWeight.bold,fontSize: 14),),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                 Text('\$${itemList[index].price}',style: const TextStyle(color: Colors.white,fontSize: 14),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart,color: Colors.white,),)
                  ],
                )
              ],
            ),
          ),
        ),
        //     Card(
        //   color: Color(0xFF232227),
        //   elevation: 5,
        //   shape: OutlineInputBorder(),
        //   child: Column(
        //     children: [
        //       Image.asset('images/1.png',height: 100,width: 100,fit: BoxFit.cover,)
        //     ],
        //   ),
        //
        // ),
    );
  }
}
