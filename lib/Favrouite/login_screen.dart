import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:learning_provider/View/MyHomePageScreen.dart";
import "package:learning_provider/provider/auth_provider.dart";
import "package:provider/provider.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    if(provider.isLoggedIn){
      Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePageScreen(),));
    }
    return Scaffold(
      appBar: AppBar(title: Text("login with the provider")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "password",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                provider.loggedIn(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                width: 600,
                child: Center(
                    child: provider.loading
                        ? Text("loading", style: TextStyle(fontSize: 35))
                        : Text("login", style: TextStyle(fontSize: 35))),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
