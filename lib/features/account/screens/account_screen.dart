import 'package:app4/features/account/widgets/orders.dart';
import 'package:app4/features/account/widgets/top_buttons.dart';
import 'package:app4/features/account/widgets/hello_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app4/constants/global_variables.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          leading: Container(
            alignment: Alignment.topLeft,
            child: Center(
              child: Image.asset(
                'assets/images/Bull.png',
              ),
            ),
          ),
          title: Container(
            alignment: Alignment.topLeft,
            child: const Center(
              child: Text(
                'MAASAI MARKET',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications_outlined),
                  ),
                  Icon(Icons.search),
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 10),
          Orders()
        ],
      ),
    );
  }
}
