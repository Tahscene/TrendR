import 'package:flutter/material.dart';

import 'package:newsapp/pages/home.dart';
import 'package:newsapp/pages/landing_page.dart';
import 'package:newsapp/provider/theme_changer.dart';
import 'package:newsapp/screen/dark_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final themechanger = Provider.of<ThemeChanger>(context);
    return MultiProvider(providers:
    [
      ChangeNotifierProvider(create: (_)=> ThemeChanger()),


    ],

    child:Builder(builder:( BuildContext context){
      final themeChanger = Provider.of<ThemeChanger>(context);
      return MaterialApp(

      title: 'Flutter Demo',
      themeMode:themeChanger.themeMode,
    theme: ThemeData(
      brightness: Brightness.light,


    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,

    ),
    home: LandingPage(),
    );
    }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
