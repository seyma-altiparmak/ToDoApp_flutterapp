import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutterapp/data/entity/todo.dart';
import 'package:todoapp_flutterapp/ui/cubit/detailscubit.dart';

class DetailsPage extends StatefulWidget {
  ToDo todo;

  DetailsPage({required this.todo});

  @override
  State<DetailsPage> createState() => _DetailsState();
}

class _DetailsState extends State<DetailsPage> {
  var tf_todonote = TextEditingController();


  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tf_todonote.text = todo.todo_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DETAILS"),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tf_todonote,
                decoration: const InputDecoration(hintText: "Text your note here..."),),
              ElevatedButton(onPressed: (){
                context.read<DetailsPage_Cubit>().UpdateNote(widget.todo.todo_id,widget.todo.todo_name);
              }, child: const Text("Update"),),
            ],
          ),
        ),
      ),
    );
  }
}
