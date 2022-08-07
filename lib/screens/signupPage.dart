

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
//
  bool visiblity = true;
  final _globalkey = GlobalKey<FormState>();
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
        child: Form(
          key: _globalkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SignUp with Email", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),),
              SizedBox(height: 40,),
              UsernameTextField(),
              EmailTextField(),
              PasswordTextField(),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  if(_globalkey.currentState!.validate()){

                    print("validated");
                  }
                },
                child: Container(
                  width: 150,
                  height: 50,
                  child: Center(child: Text("SignUp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget UsernameTextField(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Text("Username"),
          TextFormField(
            validator: (value){
              if(value!.isEmpty)
                return "Username can't be empty";
              return null;
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget EmailTextField(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Text("Email"),
          TextFormField(
            validator: (value){
              if(value!.isEmpty)
                return "Email can't be empty";
              if(!value.contains("@"))
                return "Invalid Email";

            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget PasswordTextField(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Text("Password"),
          TextFormField(
            validator: (value){
              if(value!.isEmpty)
                return "Can't  be null";
              if(value.length<=8)
                return "too short";
            },
            obscureText: visiblity,
            decoration: InputDecoration(
              suffixIcon: IconButton(icon: Icon(visiblity==true ? Icons.visibility_off : Icons.visibility),
                onPressed:(){
                  setState((){
                    visiblity = !visiblity;
                  });
                },),
              helperText: "Password length should be 8 characters long",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
