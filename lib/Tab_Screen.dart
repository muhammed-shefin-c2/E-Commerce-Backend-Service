import 'package:flutter/material.dart';
import 'package:commerce_js_mobile_app/Screens/Account_Screen.dart';
import 'package:commerce_js_mobile_app/Screens/Bell_Screen.dart';
import 'package:commerce_js_mobile_app/Screens/Cart_Screens.dart';
import 'package:commerce_js_mobile_app/Screens/Home_Screen.dart';
import 'package:commerce_js_mobile_app/Screens/Product_Grid.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});



  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int CurrentPageIndex = 0;

  var Tabs_ = [
    HomeScreen(),
    ProductGrid(),
    BellScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Material(
           elevation: 11,
          //color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            child: Stack(
              children: [
                NavigationBar(
                  selectedIndex: CurrentPageIndex,
                    onDestinationSelected: (int Index){
                    setState(() {
                      if (Index >= 0 && Index < Tabs_.length) {
                        CurrentPageIndex = Index;
                      }
                    });
                    },
                    backgroundColor: Colors.white,
                  indicatorColor: Colors.grey.shade300,
                  height: 70,
                    destinations: [
                    NavigationDestination(icon: Icon(Icons.home,size: 30,color: Color(0xFF000008),),label: '',),
                    NavigationDestination(icon: ImageIcon(AssetImage('assets/NavigationBar/cart (2).png'),size: 20,),label: '',),
                    NavigationDestination(icon: ImageIcon(AssetImage('assets/NavigationBar/notification (2).png'),size: 20,),label: '',),
                    NavigationDestination(icon: ImageIcon(AssetImage('assets/NavigationBar/profile (1).png'),size: 20,),label: '',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Tabs_[CurrentPageIndex],
      ),
    );
  }
}
