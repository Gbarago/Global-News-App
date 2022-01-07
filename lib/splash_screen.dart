import 'package:flutter/material.dart';

import 'home.dart';

//import '/Screens/loggin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    _navigateToLaunch();
  }

  _navigateToLaunch() async {
    await Future.delayed(Duration(seconds: 5), () {});

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              'assets/news.png',
            ),
          ),
        )),
      ),
    );
  }
}
