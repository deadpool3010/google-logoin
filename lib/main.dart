import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlelogin/firebase_options.dart';
import 'package:sign_in_button/sign_in_button.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
User? user;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    auth.authStateChanges().listen((event) {
      setState(() {
        user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google'),
      ),
      body: user != null ? userInfo() : googlesigninbutton(),
      floatingActionButton: user != null ? logout() : null,
    );
  }

  Widget googlesigninbutton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 160,
            child: SignInButton(
              onPressed: () {
                signin();
              },
              Buttons.google,
              text: "Google Login",
            ),
          ),
        ],
      ),
    );
  }

  Widget userInfo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You are successfully logged in"),
          SizedBox(height: 10),
          user != null
              ? Text("Email: ${user?.email ?? 'N/A'}")
              : Text("User not found"),
        ],
      ),
    );
  }

  Widget logout() {
    return FloatingActionButton(
      onPressed: signout,
      child: Icon(Icons.logout),
    );
  }

  void signin() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      await auth.signInWithProvider(googleProvider);
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }
  // void signin() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     await auth.signInWithCredential(credential);
  //   } catch (e) {
  //     print('Error signing in with Google: $e');
  //   }
  // }

  void signout() async {
    if (user != null) {
      await auth.signOut();
      await GoogleSignIn().signOut();
    }
  }
}
