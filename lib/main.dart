import 'package:flutter/material.dart';
import 'package:flutter_demo/provider.dart';
import 'package:flutter_demo/second_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => CounterProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Intro',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // data types
  double firstNumber = 0;
  double secondNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First Flutter Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      firstNumber = double.parse(value);
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: 'First Number', border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                '+',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      secondNumber = double.parse(value);
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: 'Second Number', border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const SecondScreen())));

              setState(() {
                context
                    .read<CounterProvider>()
                    .updateResult(sumNumbers(firstNumber, secondNumber));
              });
            },
            child: const Text('Show Answer'),
          )
        ],
      ),
    );
  }

  double sumNumbers(double firstNumber, double secondNumber) {
    double result = firstNumber + secondNumber;
    return result;
  }

  double subtractNumbers(double firstNumber, double secondNumber) {
    double result = firstNumber - secondNumber;
    return result;
  }
}

// type
// struct
// class
class Student {
  String firstName = "";
  String lastName = "";
  String className = "";
  int age = 20;
}
