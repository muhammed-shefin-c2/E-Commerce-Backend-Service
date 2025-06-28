import 'package:commerce_js_mobile_app/Screens/Sinup_Succes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:commerce_js_mobile_app/Screens/Home_Screen.dart';
import 'package:commerce_js_mobile_app/Tab_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _formkey = GlobalKey<FormState>();


class SingUpScreen extends StatefulWidget {
  SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}



class _SingUpScreenState extends State<SingUpScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _PasswordTextController;
  late TextEditingController _NameTextController;
  late TextEditingController _ConfirmPass;
  bool isConfirmPassValid = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  bool isValid = false;
  bool is1Pasvalid = false;
  bool isNamevalid = false;
  bool isConfirmValid = false;
  bool isChecked = false;
  bool _isHidden = true;
  bool _1isHidden = true;


  @override
  void initState() {
      super.initState();
      _emailTextController = TextEditingController();
      _PasswordTextController = TextEditingController();
      _NameTextController = TextEditingController();
      _ConfirmPass = TextEditingController();
  }

    @override
  void dispose() {
    _emailTextController.dispose(); // Dispose the controller to free memory
    _PasswordTextController.dispose();
    _NameTextController.dispose();
    _ConfirmPass.dispose();
    super.dispose();
  }

String? _validateConfirmPass(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != _PasswordTextController.text) {
    setState(() {
      isConfirmValid = false; // Set red icon when passwords don't match
    });
    return 'Passwords do not match';
  }
  setState(() {
    is1Pasvalid = true; // Set black icon when passwords match
  });
  return null;
}

  bool _validateName(String value) {
  // Regex pattern for validating a name
  final RegExp nameRegExp = RegExp(r"^[a-zA-Z ]{3,}$");

  // Check if the name matches the pattern
  setState(() {
      isNamevalid = nameRegExp.hasMatch(value); // Update isValid based on regex match
    });
  return nameRegExp.hasMatch(value);
}

   void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  void _1toggleVisibility() {
    setState(() {
      _1isHidden = !_1isHidden;
    });
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
      is1Pasvalid = passwordRegex.hasMatch(value); // Update isValid based on regex match
    });
    if(!passwordRegex.hasMatch(value)) {
      return 'The password can contain letters, numbers, or the listed special characters.';
    };
    return null;
  }
// confirming password
  String? _validateConfirmPassword (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Password';
    };
    if (value.length < 8){
      return 'Password should be at least 8 characters';
    }

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$',
    );
    setState(() {
      is1Pasvalid = passwordRegex.hasMatch(value); // Update isValid based on regex match
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
  if (_formkey.currentState!.validate()) {
    try {
      var email = _emailTextController.text.trim();
      var password = _PasswordTextController.text.trim();
      var name = _NameTextController.text.trim();
      isChecked = true;

      // if(isChecked == true){
      //   return null;
      // }

      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User user = userCredential.user!;

      await user.updateDisplayName(name);
      await user.reload();

      await _firebaseFirestore.collection("users").doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'displayName': name,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print("Succes");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Signed up successfully')));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SinupSucces()));
    } catch (e) {
      print("Error: $e");  // Log the error to debug
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('already Created or failed'))
      );
    }
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
                    height: 120,
                  ),
                  Text("Sing Up", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Create a new account", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Colors.grey.shade500),),
                  SizedBox(
                    height: 70,
                  ),
                  TextField(
                    controller: _NameTextController,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                      labelText: 'User Name',
                      suffixIcon: Icon(Icons.check_circle_rounded, color: isNamevalid ? Colors.black : Colors.red.shade900, size: 20,)
                    ),
                    onChanged: (value) {
                      _validateName(value);
                      },
                    //validator: _validateName,
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
                        color: Colors.grey.shade700,
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
                    obscureText: _isHidden,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility, color: is1Pasvalid ? Colors.black : Colors.red.shade900, size: 20,),
                      //border: OutlineInputBorder(),
                        onPressed: (){
                          _toggleVisibility();
                        },
                    ),
                  ),
                     onChanged: _validatePassword,
                    validator: _validatePassword,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _ConfirmPass,
                    obscureText: _1isHidden,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(_1isHidden ? Icons.visibility_off : Icons.visibility,
                        color:  _ConfirmPass.text  == _PasswordTextController.text && _ConfirmPass.text.isNotEmpty?
                        Colors.black : Colors.red.shade900,
                        size: 20,
                      ),
                      //border: OutlineInputBorder(),
                        onPressed: (){
                          _1toggleVisibility();
                        },
                    ),
                      //border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _validateConfirmPass(value);
                      },
                    validator: _validateConfirmPass,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Checkbox(
                            checkColor: Colors.black,
                            activeColor: Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                          SizedBox(
                            height: 13,
                          )
                        ],
                      ),
                      Text('By creating an account you hve to agree \nwith over terms & condition.', style: TextStyle(fontSize: 14, color: Colors.grey.shade500),),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: ElevatedButton(onPressed: () async {

                      //_formkey.currentState!.validate();
                      _onlLogin();
                      print('Saved email: ${_emailTextController.text}');
                      print('Saved password: ${_PasswordTextController.text}');
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Change the background color
                          foregroundColor: Colors.white,
                          minimumSize: Size(400, 50)
                        ),
                        child: Text("Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
                  ),
                ],
                  )
                  )
              ),
            ),
          ),
    );
  }
}
