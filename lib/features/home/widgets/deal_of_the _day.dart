import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the day',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Image.network(
              'https://images.unsplash.com/photo-1530893609608-32a9af3aa95c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
              height: 235,
              fit: BoxFit.fitHeight),
          Container(
              padding: const EdgeInsets.only(left: 15),
              alignment: Alignment.center,
              child: const Text('\$100')),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            child: const Text(
              'Laptop & Accessories',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1587302912306-cf1ed9c33146?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGdhbWluZyUyMHBjfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  'https://images.unsplash.com/photo-1587302912306-cf1ed9c33146?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGdhbWluZyUyMHBjfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  'https://images.unsplash.com/photo-1587302912306-cf1ed9c33146?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGdhbWluZyUyMHBjfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  'https://images.unsplash.com/photo-1587302912306-cf1ed9c33146?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGdhbWluZyUyMHBjfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: const Text(
              'See all deals',
              style: TextStyle(color: Colors.amber),
            ),
          )
        ],
      ),
    );
  }
}
