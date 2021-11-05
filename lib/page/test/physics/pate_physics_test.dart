import 'package:flutter/material.dart';

class PagePhysics extends StatefulWidget {
  const PagePhysics({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhysicsState();
}

class _PhysicsState extends State<PagePhysics> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("小球坠落"),
      ),
    );
  }
}
