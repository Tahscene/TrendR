import 'package:flutter/material.dart';
import 'package:newsapp/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/provider/theme_changer.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen  ({super.key});

  @override

  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(

          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
              },
              icon: Icon(Icons.arrow_back_ios, size: 20, ),
            ),
            Text("Them"),
            Text(
              "E",
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body:
      Column(
        children:[
          Container(
            alignment: Alignment.bottomCenter,
            child:Image.asset("images/fa.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3.5,
              fit: BoxFit.cover,
            ),
          ),



          RadioListTile<ThemeMode>(
              title: Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme

          ),
          RadioListTile<ThemeMode>(
              title: Text('Dark Mode'),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme

          ),
          RadioListTile<ThemeMode>(
              title: Text('System Mode'),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme

          )
        ],
      ),
    );
  }
}
