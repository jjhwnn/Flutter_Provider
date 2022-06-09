// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_08/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog08', breed: 'breed08', age: 3),
      child: MaterialApp(
        title: 'Provider 08',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 08'),
      ),
      body: Consumer<Dog>(
        builder: (BuildContext context, Dog dog, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '- name: ${dog.name}',
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                BreedAndAge(),
              ],
            ),
          );
        },
        child: const Text(
          'I like dogs very much',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(builder: (_, Dog dog, __) {
      return Column(
        children: [
          Text(
            '- breed: ${dog.breed}',
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Age(),
        ],
      );
    });
  }
}

class Age extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(builder: (_, dog, __) {
      return Column(
        children: [
          Text(
            '-age: ${dog.age}',
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => dog.grow(),
            child: const Text(
              'Grow',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      );
    });
  }
}
