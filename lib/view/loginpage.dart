import 'package:flutter/material.dart';
import 'package:flutter_demo/view/signup.dart';
import 'package:go_router/go_router.dart';

class MyloginPage extends StatefulWidget {
  const MyloginPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyloginPageState();
}

class _MyloginPageState extends State<MyloginPage> {
  final TextEditingController _textEmailEditingController =
      TextEditingController();
  final TextEditingController _textPasswordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        color: Colors.lightGreen,
        child: Column(
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 50), // Add space from top
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(
              "Login",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 53,
              ),
            ),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _textEmailEditingController,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    focusColor: Colors.lightGreen,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _textPasswordEditingController,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    focusColor: Colors.lightGreen,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: onLoginClick,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onSigUpClick,
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void onSigUpClick() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  void onLoginClick() {
    if (_textEmailEditingController.text == "Susan" &&
        _textPasswordEditingController.text == "Susan") {
      context.go("");
    }
  }
}
