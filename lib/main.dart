import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  String name = "Obi is boy";
  bool isRequired = true;

  // data structures
  // Student kennis = Student(); // complex data type
  // kennis.age = 20;
  // kennis.firstName = "Kennis";

  List<String> students = [
    "Kennis",
    "Isreal",
    "Faith",
    "Kolade",
  ];

  // Map<String, String> studentsMap = {
  //   "kennis": "kennis",
  //   "kennise": "kennis",
  //   "kennises": "kennis",
  //   "kenniseses": "kennis",
  //   "kenniseseses": "kennis",
  // };

  // control structures
  // if (isRequired == true) {
  //   // truth path
  // } else {
  //   // false path
  // }

  // switch (variable) {
  //   case 1:
  //     break;
  //   case 2:
  //     break;
  //   default:
  // }

  // // iterators
  // for (var element in students) {
  //   // for each item in the students list
  // }

  // for (var i = 0; i < 10; i++) {
  //   // 10 times
  // }

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
          const Text('Welcome to Flutter'),
          const Text('Build beautiful apps'),
          Image.asset('assets/images/demo-image2.png', width: 200, height: 200),
          if (isRequired == false) ...[
            Image.network(
              'https://images.unsplash.com/photo-1761839257475-4ca368dae6c3?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              height: 200,
              width: 200,
            ),
          ],
          // ...students.map(
          //   (s) => Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 10),
          //     child: Text(s),
          //   ),
          // ),
          for (var item in students) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(item),
            ),
          ],
          Text(name),
          const SizedBox(
            height: 20,
          ),
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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: ((context) => const OtherScreen())));
              setState(() {
                // isRequired = !isRequired;
                name = sumNumbers(firstNumber, secondNumber).toString();
              });
            },
            child: const Text('Answer'),
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
