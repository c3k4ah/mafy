import 'package:flutter/material.dart';

import 'colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: width,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: height,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: height,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ).copyWith(left: 0),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: width,
                  color: Colors.transparent,
                ),
              ),
              Container(
                height: 100,
                width: width,
                color: Colors.amberAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
