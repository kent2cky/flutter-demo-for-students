import 'package:flutter/material.dart';
import 'package:flutter_demo/provider.dart';
import 'package:flutter_demo/second_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var firstNumberController = TextEditingController();
  var secondNumberController = TextEditingController();

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
                  controller: firstNumberController,
                  onChanged: (value) {
                    setState(() {
                      firstNumber = double.parse(value);
                      _saveFirstNumber(firstNumber);
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
                  controller: secondNumberController,
                  onChanged: (value) {
                    setState(() {
                      secondNumber = double.parse(value);
                      _saveSecondNumber(secondNumber);
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
              var result = sumNumbers(firstNumber, secondNumber);
              setState(() {
                context.read<CounterProvider>().updateResult(result);
              });
            },
            child: const Text('Show Answer'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _loadFirstNumber();
              _loadSecondNumber();
            },
            child: const Text('Show previous calculation'),
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

  Future<void> _loadFirstNumber() async {
    print('fetching stored firstnumber');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstNumber = prefs.getDouble('firstNumber') ?? 0;
      firstNumberController.text = firstNumber.toString();
      print('fetching stored first number $firstNumber');
    });
  }

  Future<void> _loadSecondNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      secondNumber = prefs.getDouble('secondNumber') ?? 0;
      secondNumberController.text = secondNumber.toString();
      print('fetching stored second number $secondNumber');
    });
  }

  Future<void> _saveSecondNumber(double number) async {
    print('saving second number.');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      secondNumber = number;
    });
    await prefs.setDouble('secondNumber', secondNumber);
  }

  Future<void> _saveFirstNumber(double number) async {
    print('saving first number.');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstNumber = number;
    });
    await prefs.setDouble('firstNumber', firstNumber);
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
