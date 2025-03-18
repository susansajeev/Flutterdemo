import 'package:flutter/material.dart';
import 'package:flutter_demo/view/movies.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUpPage> {
  final TextEditingController _textName = TextEditingController();
  final TextEditingController _textEmail = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        color: Colors.lightGreen,
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex: 1,
              child: Text(
                "SignUp",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 53,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _textName,
                    decoration: InputDecoration(
                      labelText: "Enter Name",
                      focusColor: Colors.lightGreen,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _textEmail,
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
                    controller: _textPassword,
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
                        onPressed: onBackClick,
                        child: Text(
                          "Back",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onRegisterClick,
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
            ),
          ],
        ),
      ),
    );
  }

  void onRegisterClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Movies()));
  }

  void onBackClick() {
    Navigator.pop(context);
  }
}
