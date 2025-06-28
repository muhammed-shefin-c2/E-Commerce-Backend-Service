import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:commerce_js_mobile_app/Screens/Home_Screen.dart';
import 'package:commerce_js_mobile_app/Tab_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _formkey = GlobalKey<FormState>();


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _PasswordTextController;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isValid = false;
  bool isPasvalid = false;


  @override
  void initState() {
      super.initState();
      _emailTextController = TextEditingController();
      _PasswordTextController = TextEditingController();
  }

    @override
  void dispose() {
    _emailTextController.dispose(); // Dispose the controller to free memory
    _PasswordTextController.dispose();
    super.dispose();
  }



  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Password';
    };
    if (value.length < 8){
      return 'Password should be at least 8 characters';
    }

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$',
    );
    setState(() {
      isPasvalid = passwordRegex.hasMatch(value); // Update isValid based on regex match
    });
    if(!passwordRegex.hasMatch(value)) {
      return 'The password can contain letters, numbers, or the listed special characters.';
    };
    return null;
  }
  // Email validation function
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // RegEx for validating an email
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    setState(() {
      isValid = emailRegex.hasMatch(value); // Update isValid based on regex match
    });
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null; // Return null if the input is valid
  }

  void _onlLogin() async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: _emailTextController.text,
          password: _PasswordTextController.text);
      if (_formkey.currentState!.validate()) {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => TabScreen()),
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login succesfully')),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account not found, Please sing up')),
      );
    }
  }

  void onSave() {
    if(_formkey.currentState!.validate()) {
     print('Saved Email: ${_emailTextController.text}');
    }
    print(_emailTextController.text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 75,
                      ),
                      Image.asset('assets/logo/Shein_logo_PNG2.png', height: 100, width: 200,),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Welcome!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  Text("please login or sign up to continue our app", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey.shade500),),
                  SizedBox(
                    height: 70,
                  ),
                  TextFormField(
                    controller: _emailTextController,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.check_circle_rounded, color: isValid ? Colors.black : Colors.red.shade900, size: 20,),
                      //border: OutlineInputBorder(),
                    ),
                    onChanged: _validateEmail,
                    validator: _validateEmail,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _PasswordTextController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.check_circle_rounded, color: isPasvalid ? Colors.black : Colors.red.shade900, size: 20,)
                      //border: OutlineInputBorder(),
                    ),
                    onChanged: _validatePassword,
                    validator: _validatePassword,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ElevatedButton(onPressed: () {
                      //_formkey.currentState!.validate();
                      _onlLogin();
                      print('Saved email: ${_emailTextController}');
                      print('Saved password: ${_PasswordTextController}');
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Change the background color
                          foregroundColor: Colors.white,
                          minimumSize: Size(400, 50)
                        ),
                        child: Text("Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                  // Left Line
                     Expanded(
                       child: Divider(
                         thickness: 0.5, // Thickness of the line
                         color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or',
                      style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Right Line
                  Expanded(
                    child: Divider(
                      thickness: 0.5, // Thickness of the line
                      color: Colors.grey,
                    ),
                  ),
                ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: Column(
                    children: [
                      ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(400, 50),
                            backgroundColor: Colors.blue.shade800,
                            foregroundColor: Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook, size: 18,),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Continue with Facebook", style: TextStyle(fontSize: 18),),
                            ],
                          )
                      ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 50),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90),
                        side: BorderSide(
                          color: Colors.grey,
                          width: 0.1,
                        ),
                      ),
                      ),
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.google, size: 16, color: Colors.black,),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Continue with Google", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          ),
                    ),
                    SizedBox(
                        height: 25,
                    ),
                    ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 50),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90),
                        side: BorderSide(
                          color: Colors.grey,
                          width: 0.1,
                        ),
                      ),
                      ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.apple, size: 22, color: Colors.black,),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Continue with Apple", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                ],
                  )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

