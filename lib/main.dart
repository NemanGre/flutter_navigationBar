import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'animated button',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animationController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          _animationController.forward(from: 0);
      });

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 60,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1, 0), blurRadius: 1, color: Colors.grey)
              ],
              gradient: SweepGradient(
                  startAngle: 4,
                  colors: [Colors.black12, Colors.cyanAccent],
                  transform: GradientRotation(_animationController.value * 3))),
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Text("GRE NEMAN"),
            ),
          ),
        ),
      ),
    );
  }
}
