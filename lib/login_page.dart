import 'package:flutter/material.dart';
import 'package:freshstart/signup_page.dart';

final String imgsrc =
    'https://c.tenor.com/QNP6E3bnOiUAAAAC/long-livethe-blob-monkey.gif';

class FormScreen extends StatefulWidget {
  const FormScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FormScreen> createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //   'Login Page',
      //   style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      // )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imgsrc), fit: BoxFit.cover)),
              ),
              const Text(
                'Login Page',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  //error case check
                  if (value == null || value.isEmpty) {
                    return 'please enter your email_id';
                  }
                  if (!value.contains('@') || !value.contains('gmail.com')) {
                    return 'please enter the valid email_id';
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: '   @      Email ID'),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password required';
                  }
                },
                obscureText: hidePassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password ',
                  suffixIcon: InkWell(
                      onTap: () {
                        hidePassword = !hidePassword;
                        setState(() {});
                      },
                      child: Icon(Icons.visibility)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                // minWidth: 400,
                // shape:
                //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                // color: Colors.blue,
                onPressed: () {},
                child: Text(
                  '                                      Forgot Password?',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: 400,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.blue[900],
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => NavigatorScreen()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 2,
                    width: 130,
                    color: Colors.grey,
                  ),
                  Text("         OR          "),
                  Container(
                    height: 2,
                    width: 130,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 30),
              MaterialButton(
                minWidth: 100,
                height: 45,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.grey[300],
                onPressed: () {},
                child: Text(
                  'Login with Google ',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New to logistic?'),
                  MaterialButton(
                    // minWidth: 400,
                    // shape:
                    //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    // color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
