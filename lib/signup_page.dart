import 'package:flutter/material.dart';
import 'package:freshstart/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

final String imgsrc1 =
    'https://c.tenor.com/cvwoUZBC3sYAAAAM/whiskey-ei-suoi-amici-coccole-sonore.gif';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  createUserWithFirebase() async {
    try {
      final Credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      print(Credential.toString());
      Fluttertoast.showToast(msg: "Succesful login!");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
      Fluttertoast.showToast(msg: e.message ?? "AN error while signing up");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              Container(
                height: 150,
                width: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imgsrc1), fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                '   Sign UP Page ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: 'Mobile  ',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: ' Your New PassWord ',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 2,
                    width: 130,
                    color: Colors.grey,
                  ),
                  Text("           OR          "),
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
                  'Signup with Google Account ',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                minWidth: 400,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.blue[900],
                onPressed: () {},
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text('By signing up , you are agreeing to our T&C   '),
              Row(
                children: [
                  Text('joined us before ?'),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => FormScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
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
