import 'package:eventplaner/constant/inputfields.dart';
import 'package:eventplaner/screens/signInPage.dart';
import 'package:eventplaner/services/authentication_methods.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../constant/TextField.dart';
import '../constant/Utils.dart';
import '../constant/constants.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController eController = TextEditingController();
    TextEditingController LastController = TextEditingController();

  TextEditingController FirstController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizedBox k = SizedBox(
      height: 20,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset('assets/th2.jpeg'),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              inputfields(
                  hint_text: "Enter FirstName", controller: FirstController,field_icon: Icons.abc,),
              k,
              inputfields(
                  hint_text: "Enter LastName", controller: LastController,field_icon: Icons.abc,),
              k,
              inputfields(hint_text: "Enter Email", controller: eController,field_icon: Icons.mail_outline,),
              k,
              inputfields(hint_text: "Enter Phone", controller:PhoneController,field_icon: Icons.phone,),

              k,
              inputfields(
                  hint_text: "Enter Password", controller: PassController,field_icon: Icons.password),
              k,
              GestureDetector(
                onTap: ()async {
                  
String output= await authentication_methods.SignupUsers(
                              firstname: FirstController.text,
                               lastname: LastController.text,
                              email: eController.text,
                              phone: PhoneController.text,
                              password: PassController.text,
                            );
                           if (output=="SignUp Successfully") {
                               Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SignIn()));
                           } else {
                      Utils.showSnackBar(context: context, content: output.toString());

                           } 

                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/google.png'),
                    ),
                    Text(
                      'Sign Up with Google',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child:  SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
