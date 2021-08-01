import 'package:flutter/material.dart';
import 'package:monsoomer/screens/authenticate/authenticate.dart';
import 'package:monsoomer/screens/wrapper.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monsoomer/services/auth_service.dart';

import 'managers/file_manager.dart';
import 'screens/home/landing_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MonsoomerApp());
}

class MonsoomerApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  static FileManager fileManager = FileManager();


  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(value: AuthService().user, initialData: null,), //initial value will be NULL!!! check for it
        ChangeNotifierProvider(create:  (_) => fileManager),
      ],
      child: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            if(snapshot.hasError)
            {
              print("Error initializing firebase ${snapshot.error.toString()}");
              //TODO: make a better error screen
              return Text("Something went wrong");
            }
            else if(snapshot.hasData){
              print("Connected to firebase.");
              return MaterialApp(
                themeMode: ThemeMode.dark,
                theme: ThemeData(
                  brightness: Brightness.light,
                  fontFamily: 'NanumGothic',
                  primaryColor: Colors.deepPurple,
                  //primarySwatch: generateMaterialColor(Colors.teal),
                  /* light theme settings */
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  fontFamily: 'NanumGothic',
                  primaryColor: Colors.deepPurple,
                  /* dark theme settings */
                ),
                home: Wrapper(),
                initialRoute: Wrapper.id,
                routes: {
                  Wrapper.id: (context) => Wrapper(),
                  LandingScreen.id: (context) => LandingScreen(),
                  Authenticate.id: (context) => Authenticate(),
                  // LoadingScreen.id: (context) => LoadingScreen(),
                  // LoginScreen.id: (context) => LoginScreen(),
                  // RegistrationScreen.id: (context) => RegistrationScreen(),

                },
              );
            }
            else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}