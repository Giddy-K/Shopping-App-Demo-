import 'package:app4/constants/global_variables.dart';
import 'package:flutter/material.dart';


class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const  Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient:  GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Center(
                  child: Image.asset('assets/images/amazon_in.png',
                      width: 150,
                      height: 50,
                      color: Colors.black),
                ),
              ),
              Container(
                padding:  const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const [
                      Padding(
                      padding:  EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}