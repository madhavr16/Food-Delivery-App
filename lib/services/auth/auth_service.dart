import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get current user
  User? get currentUser{
    return _firebaseAuth.currentUser;
  }

  //sign in
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async{
    //try sign in user
    try{
      //sign user in
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    }
    //catch error
    on FirebaseAuthException catch(e){
      //return error message
      throw Exception(e.code);
    } 
  }
  //sign up
  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async{
    //try sign up user
    try{
      //sign user up
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    }
    //catch error
    on FirebaseAuthException catch(e){
      //return error message
      throw Exception(e.code);
    } 
  }

  //sign out
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}