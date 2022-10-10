
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/food_controller.dart';
import '../model/food_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodController controller=Get.put(FoodController());
    final item=ModalRoute.of(context)!.settings.arguments as FoodModel;
    return Scaffold(
      backgroundColor: const Color(0xFF232227),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(left: 25,top: 10,right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                Stack(children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart,color: Colors.white,)),
                  Obx(() => Positioned(top: 0,
                      left: 0,
                      child: Text(
                        '${controller.order.value}',style: const TextStyle(color: Colors.red),)))
                ])
              ],
            ),
            const SizedBox(height: 20,),
            Image.asset(item.url,height: 450,fit: BoxFit.contain,),
        Obx(() =>     Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hot & Fresh ${item.name}',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),),
            InkWell(
              onTap: (){
                if(controller.quantity.value<=1){
                  return;
                }
                else{
                  controller.quantity.value--;
                }
              },
              splashColor: Colors.red,
              child: Ink(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.circular(5)
                ),
                child: const Icon(Icons.remove),
              ),
            ),
            Text('${controller.quantity}',style: const TextStyle(color: Colors.white),),
            InkWell(
              onTap: (){
                controller.quantity.value++;
              },
              splashColor: Colors.green,
              child: Ink(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.circular(4)
                ),
                child: const Icon(Icons.add,),
              ),
            ),

          ],
        )),
           const SizedBox(height: 10,),
          Flexible(
              child: Text('A burger is a patty of ground beef grilled and placed between two halves of a bun. Slices of raw onion, lettuce, bacon, mayonnaise, and other ingredients add flavor. Burgers are considered an American food but are popular around the world.',style: TextStyle(color: Colors.white),),
            ),



          ],
        ),

      )),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Total Price',style: TextStyle(color: Colors.white54,fontWeight: FontWeight.bold,fontSize: 26),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text('\$${controller.quantity.value*item.price}',
                    style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),),
                  Container(
                    height: 50,
                    width: 120,
                    decoration: const BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20),)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Buy Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        Icon(Icons.shopping_cart,color: Colors.white,)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
