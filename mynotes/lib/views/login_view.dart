import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/register_view.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Login"),backgroundColor: Colors.blue), 
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(controller: _email, 
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter your email here"
              ),),
              TextField(controller: _password,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                hintText: "Enter your password here"
              ),),
              TextButton(
                onPressed: () async {
                  
                  try{
                    final email = _email.text;
                  final password = _password.text;
                  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                  const credential = UserCredential;
                  print(credential);
      
                  }
                  on FirebaseAuthException catch(e){
                    print(e.code);
                  }
                  catch(e){
                    print("something bad happened");
                    print(e);
                  }
      
                  
                }, 
                child: const Text('Login')),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/register/', (route) => false);
                }, child: const Text("Not registered? Click Here.") )
            ],
          
          )),
    );
 
}
}