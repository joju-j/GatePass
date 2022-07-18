import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_app/supabase/authentication.notifier.dart';
import 'package:provider/provider.dart';

import '../screens/student/menupage.dart';

class LoginView extends StatefulWidget{
  @override
  _LoginViewState createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
  void click() {}
  TextEditingController _id = TextEditingController();
  TextEditingController passController=TextEditingController();
@override
void initState(){
  _id = TextEditingController();
  passController = TextEditingController();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier=
    Provider.of<AuthenticationNotifier>(context,listen: false);



    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(224, 101, 88, 1.0),
                Color.fromARGB(255, 243, 243, 242),
                Colors.blue,
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                height: 420,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 233, 153, 153),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "WayOut App",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Calistoga',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please Login to Your Account",
                      style: TextStyle(
                        color: Color.fromARGB(255, 240, 236, 236),
                        fontSize: 15,
                        fontFamily: 'Chilanka',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 260,
                      height: 60,
                      child: TextField(
                        controller: _id,
                        decoration: InputDecoration(
                            // suffix: Icon(
                            //   FontAwesomeIcons.envelope,
                            //   color: Colors.red,
                            // ),
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.black),
                            //fillColor: Colors.red,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 260,
                      height: 60,
                      child: TextField(
                        
                        obscureText: true,
                        controller: passController,
                        decoration: InputDecoration(
                            
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),

                    Spacer(flex: 1),
                    ElevatedButton(
                     onPressed: () async{
                      String id= _id.text;
                      String password =passController.text;
                      if(id.isNotEmpty && password.isNotEmpty){
                        String? va =await authenticationNotifier.login(id: id, password: password);
                        print(va);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Menupage()));

                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check entered details")));
                      }
                     },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, top: 0, bottom: 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: Color.fromARGB(255, 122, 30, 172),
                        shadowColor: Colors.black,
                        elevation: 10,
                      ),

                      child: const Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                        
                            fontWeight: FontWeight.bold),
                      ),
                      onLongPress: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Menupage())),
          
                      },
                      //onLongPress: () => {print("hii")},
                    ),

                    const SizedBox(
                      height: 17,
                    ),
                    Spacer(flex: 1),
              
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

