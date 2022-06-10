import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_11/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<Counter>(
          create: (_) => Counter(),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${context.watch<Counter>().counter}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      'Increment',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      context.read<Counter>().increment();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
