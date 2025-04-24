import 'package:flutter/material.dart';

class AddNewArticlePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddNewArticlePage());
  const AddNewArticlePage({super.key});

  @override
  State<StatefulWidget> createState() => _AddNewAsticlePageState();
}

class _AddNewAsticlePageState extends State<AddNewArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
      IconButton(
        onPressed: () {
          Navigator.push(context, AddNewArticlePage.route());
        },
        icon: const Icon(Icons.done_rounded),
      )
    ]));
  }
}
