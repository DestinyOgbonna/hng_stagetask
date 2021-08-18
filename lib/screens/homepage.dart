import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng_stagetask/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 //form key
  final validateKey = GlobalKey<FormState>();

  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();

  //dispose the values in the Textfield
  @override
  void dispose(){
    usernameTextEditingController.dispose();
    emailTextEditingController.dispose();
   addressTextEditingController.dispose();
    super.dispose();
  }

 ValidateDetails(){
    // validating the form fields
    if (validateKey.currentState!.validate()) {

      setState(() {
        showDialog(context: context, builder: (context){
          return AlertDialog(
            // ignore: avoid_unnecessary_containers
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(usernameTextEditingController.text, style: textStyling(),),
                  Text(emailTextEditingController.text, style: textStyling(),),
                  Text(addressTextEditingController.text, style: textStyling(),),
                ],
              ),
            ),
          );
        });
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      // ignore: avoid_unnecessary_containers
      body: SafeArea(
        child: Center(
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),

              //============================Creating the form and validating the form========================
              child: Form(
                key: validateKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Please Input Your Details',
                      style: GoogleFonts.rakkas(fontSize: 40),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty || val.length < 4) {
                          return 'Must be at least 5 characters';
                        } else {
                          return null;
                        }
                      },
                      controller: usernameTextEditingController,
                      style: textStyling(),
                      decoration: textFormFields('Username'),
                    ),
                    TextFormField(
                      validator: (val) {
                        if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_"
                        r"`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)) {
                          return null;
                        } else {
                          return 'Invalid Email';
                        }
                      },
                      controller: emailTextEditingController,
                      style: textStyling(),
                      decoration: textFormFields('Email'),
                    ),
                    TextFormField(
                      validator: (val) {
                        // ignore: unrelated_type_equality_checks
                        if (val!.length > 6) {
                          return null;
                        } else {
                          return 'Address too short';
                        }
                      },
                      controller: addressTextEditingController,
                      style: textStyling(),
                      decoration: textFormFields('Address'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      //====================Validate and Display inputted text =========
                      onTap: (){
                        ValidateDetails();
                      },
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 19, vertical: 19),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.blueAccent,
                        ),
                        child: Center(
                            child: Text(
                              'Display Details',
                              style: GoogleFonts.montserrat(
                                  fontSize: 19, color: Colors.black),
                            )),
                      ),
                    ),

                    //=========================Adding links to the logo's===============
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: [
                    GestureDetector(
                        onTap: () {
                          launch('https://hng.tech/');
                        },
                        child: Image.asset('images/hnglogo.png', height: 150, width: 150,)) ,
                    GestureDetector(
                        onTap:(){
                          launch('https://zuri.team/');
                    },
                        child: Image.asset('images/zurilogo.png', height: 150, width: 150,)) ,

                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
