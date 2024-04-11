import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async{
    //get auth service
    final authService = AuthService();

    try{
      //sign in user
      await authService.signInWithEmailAndPassword(
        emailController.text, 
        passwordController.text
      );
      //navigate to home page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage()
        )
      );
    }
    //catch error
    catch(e){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        )
      ); 
    }
  }
  //navigate to home page
  /*void navigateToHome() {
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => const HomePage()
      )
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25
            ),
        
            //message,app slogan
            Text(
              'Food Delivery App',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(
              height: 25
            ),
        
            //email textfield
            MyTextField(
              controller: emailController, 
              hintText: 'Email', 
              obscureText: false,
            ),
            const SizedBox(
              height: 10
            ),
        
            //password textfield
            MyTextField(
              controller: passwordController, 
              hintText: 'Password', 
              obscureText: true,
            ),
            const SizedBox(
              height: 25
            ),
        
            //sign in button
            MyButton(
              onTap: () {
                login();
              }, 
              text: 'Sign In',
            ),
            const SizedBox(
              height: 25
            ),
        
            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}