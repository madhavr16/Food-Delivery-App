import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

   //navigate to home page
  /*void navigateToHome() {
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => const HomePage()
      )
    );
  }*/

  //register method
  void register() async{
    //get auth service
    final _authService = AuthService();

    //check if password and confirm password match, create user
    if(passwordController.text == confirmPasswordController.text){
      try{
        //sign up user
        await _authService.signUpWithEmailAndPassword(
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
  //if password and confirm password do not match
  else{
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        title: Text('Passwords do not match'),
      )
    );
  }
}

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
              'Let\'s create an account for you',
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
              height: 10
            ),
            //confirm password textfield
             MyTextField(
              controller: confirmPasswordController, 
              hintText: 'Confirm Password', 
              obscureText: true,
            ),
            const SizedBox(
              height: 25
            ),
            //sign in button
            MyButton(
              onTap: () {
                register();
              }, 
              text: 'Sign Up',
            ),
            const SizedBox(
              height: 25
            ),
        
            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have an account?',
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
                    'Login now',
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
