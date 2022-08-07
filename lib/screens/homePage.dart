

import 'package:eventplaner/screens/loginPage.dart';
import 'package:eventplaner/screens/signupPage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> animation1;
  late AnimationController _animationController2;
  late Animation<Offset> animation2;


  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 1500),vsync: this);
    animation1 = Tween<Offset>(
      begin: Offset(0.0,8.0),
      end: Offset(0.0,0.0),
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));
    _animationController.forward();

    _animationController2 = AnimationController(duration: Duration(milliseconds: 3000),vsync: this);
    animation2 = Tween<Offset>(
      begin: Offset(0.0,8.0),
      end: Offset(0.0,0.0),
    ).animate(CurvedAnimation(parent: _animationController2, curve: Curves.elasticInOut));
    _animationController2.forward();
  }
  @override
  void dispose(){
    super.dispose();
    _animationController.dispose();
    _animationController2.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue],
            begin: const FractionalOffset(1, 0),
            end: const FractionalOffset(1, 0),
            tileMode: TileMode.repeated,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              SlideTransition(
                position: animation1,
                child: Text(
                  "Plan your events with us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 38,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(
                  height: 30
              ),
              boxContainer("   Sign up with Facebook", Icons.facebook,null),
              SizedBox(height: 10,),
              boxContainer("   Sign up with Email", Icons.mail,onEmailClick),
              SizedBox(height: 30,),
              SlideTransition(
                position: animation2,
                child: Row(children: [
                  Text("Already have an account?",style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: Text("SignIn",style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),),
                  )
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }

  onEmailClick(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpPage()));
  }
  Widget boxContainer(String text,IconData iconData,onClick){
    return SlideTransition(
      position: animation2,
      child: InkWell(
        onTap:onClick,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Row(
              children: [
                Icon(iconData,color: Colors.black),
                Text(text,style: TextStyle(fontSize: 16, color: Colors.black87),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
