import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../widgets/tab_bar_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Color(0xFF232227),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.short_text_rounded,
                        color: Colors.white,
                        size: 35,
                      )),
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Hot & Fast Food',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Delivers on Time',
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const TabBar(
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 20),
              labelPadding: EdgeInsets.symmetric(horizontal: 20),
              tabs: [
                Tab(
                  text: 'Burger',
                ),
                Tab(
                  text: 'Pasta',
                ),
                Tab(
                  text: 'Cheese',
                ),
                Tab(
                  text: 'Pizza',
                ),
                Tab(
                  text: 'Kacchi',
                ),
              ],
            ),
            Flexible(
              flex: 1,
              child: TabBarView(children: [
                TabBarItem(itemList: itemListBurger),
                TabBarItem(itemList: itemListPasta),
                TabBarItem(itemList: itemListCheese),
                TabBarItem(itemList: itemListPizza),
                TabBarItem(itemList: itemListKacchi),

              ]),
            ),
          ],
        )),
      ),
    );
  }
}
