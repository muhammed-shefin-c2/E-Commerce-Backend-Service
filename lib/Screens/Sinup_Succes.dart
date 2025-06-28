import 'package:commerce_js_mobile_app/Tab_Screen.dart';
import 'package:flutter/material.dart';

class SinupSucces extends StatefulWidget {
  const SinupSucces({super.key});

  @override
  State<SinupSucces> createState() => _SinupSuccesState();
}

class _SinupSuccesState extends State<SinupSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
            ),
            Icon(Icons.check_circle_outline_rounded, size: 75, color: Colors.green,),
            SizedBox(
              height: 30,
            ),
            Text('Successful!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,),),
            Padding(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: Text('You have successfully registered in our app and start working in it.', style: TextStyle(fontSize: 16, color: Colors.grey),textAlign: TextAlign.center,),
            ),
            SizedBox(
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: ElevatedButton(onPressed: () async {
                Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TabScreen()));
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Change the background color
                            foregroundColor: Colors.white,
                            minimumSize: Size(400, 50)
                          ),
                          child: Text("Start Shopping", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
            ),
          ],
        ),
      ),
    );
  }
}
