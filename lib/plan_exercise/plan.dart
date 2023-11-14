import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PlanWrite extends StatefulWidget {
  const PlanWrite({super.key});

  @override
  State<PlanWrite> createState() => _PlanWriteState();
}

class _PlanWriteState extends State<PlanWrite> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Plan{
  String title='';
  String content='';

  Plan(this.title);
  Plan(this.content);
}


