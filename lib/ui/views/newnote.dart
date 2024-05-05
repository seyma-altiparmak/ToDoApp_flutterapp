import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutterapp/ui/cubit/newnotecubit.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<NewNotePage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<NewNotePage> {
  var tf_todonote = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("REGISTER"),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tf_todonote,
                decoration: const InputDecoration(hintText: "Text here your note..."),),
              ElevatedButton(onPressed: (){
                context.read<NewNote_Cubit>().Save(tf_todonote.text);
              }, child: const Text("SAVE"),),
            ],
          ),
        ),
      ),
    );
  }
}
