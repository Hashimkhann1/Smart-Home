import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/widgets/smart_device_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  List mySmartDevices = [
    ['Smart Light' , "icons/light-bulb.png" , true],
    ['Smart AC' , 'icons/air-conditioner.png' , false],
    ['Smart TV' , 'icons/smart-tv.png' , false],
    ['Smart Fan' , 'icons/fan.png' , false],
  ];

  void powerSwitchChanged(bool value , int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom appbar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "icons/menu.png",
                    height: 35,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home,",style: TextStyle(color: Colors.grey[700],fontSize: 20),),
                  Text(
                    "M Hashim",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 68
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(color: Colors.grey[400],thickness: 1),
            ),
            const SizedBox(
              height: 8.0,
            ),
            //smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Smart Devices",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.grey[800]),),
            ),
            Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mySmartDevices.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      childAspectRatio: 1/1.3
                    ),
                    itemBuilder: (context , index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SmartDeviceBox(
                          smartDeviceName: mySmartDevices[index][0],
                          iconPath: mySmartDevices[index][1],
                          powerOn: mySmartDevices[index][2],
                          onChanged: (value) => powerSwitchChanged(value , index),
                        )
                      );
                    })),
          ],
        ),
      ),
    );
  }
}


