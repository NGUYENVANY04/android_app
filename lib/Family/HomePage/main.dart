import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("data")),
          leading: const Icon(Icons.abc),
          actions: [
            const Icon(Icons.search),
          ],
        ),
        body: const Center(
          child: Text("hello world"),
        ),
      ),
    ),
  );
}
