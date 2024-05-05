import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isInSearch= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: isInSearch ?
          TextField(
            decoration: const InputDecoration(hintText: "Search Note"),
            onChanged: (searchResult){
              
            },
          ): const Text("To Do App"),
          actions: [
            isInSearch
            ? IconButton(onPressed: (){}, icon: const Icon(Icons.close)):
                IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
