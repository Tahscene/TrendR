import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/pages/admin_home.dart';
import 'package:newsapp/pages/home.dart';


class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key: key);
  @override
  _LoginPageState createState()=> _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void login(String email, String password) async {
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password
          //email: eve.holt@reqres.in
//password: pistol

        },
      );
      if(response.statusCode==200){
        var data= jsonDecode(response.body.toString());
        print(data['token']);
        print('Logged in successfully!');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminHome()));
      }
      else {
        _showErrorMessage("Login failed. Please check your credentials.");
      }
    }
    catch(e){
      print(e.toString());
      _showErrorMessage("An error occurred. Please try again later.");
    }
  }
  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(


            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Login", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),)),
                  SizedBox(height: 10,),
                  FadeInUp(duration: Duration(milliseconds: 1200), child: Text("Login to your admin console", style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700]
                  ),)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email'
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password'
                      ),
                    ),

                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        login(emailController.text.toString(),passwordController.text.toString());
                      },

                      child :Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,

                            borderRadius: BorderRadius.circular(10)

                        ),
                        child: Center(child: Text('Login',style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 18
                        ),
                        ),
                        ),


                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

      ),

    );
  }
}