import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutterapp/data/entity/todo.dart';
import 'package:todoapp_flutterapp/ui/cubit/homepagecubit.dart';
import 'package:todoapp_flutterapp/ui/views/details.dart';
import 'package:todoapp_flutterapp/ui/views/newnote.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInSearch = false;


  @override
  void initState() {
    super.initState();
    context.read<HomePage_Cubit>().noteLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          title: isInSearch
              ? TextField(
            decoration: const InputDecoration(hintText: "Search"),
            onChanged: (searchResult) {
              context.read<HomePage_Cubit>().search(searchResult);
            },
          )
              : const Text("To Do App", style: TextStyle(color: Colors.white, fontFamily: "Lemonada",),),
          actions: [
            isInSearch
                ? IconButton(
                onPressed: () {
                  setState(() {
                    isInSearch = false;
                  });
                  context.read<HomePage_Cubit>().noteLoad();
                },
                icon: const Icon(Icons.clear,color: Colors.white,))
                : IconButton(
                onPressed: () {
                  setState(() {
                    isInSearch = true;
                  });
                },
                icon: const Icon(Icons.search,color: Colors.white,)),
          ],
        ),
        body: BlocBuilder<HomePage_Cubit,List<ToDo>>(
          builder: (context, userList) {
            if (userList.isNotEmpty) {
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, i) {
                    var k = userList[i];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(todo: k)))
                            .then((value) {
                          context.read<HomePage_Cubit>().noteLoad();
                        });
                      },
                      child: Card(
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      k.todo_name,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "${k.todo_name} 'll delete u want continue?",
                                      ),
                                      action: SnackBarAction(
                                        label: "Continue",
                                        onPressed: (){
                                          context.read<HomePage_Cubit>().delete(k.todo_id);
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.delete_forever),
                                color: Colors.white12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewNotePage()))
                .then(
                  (value) {
                context.read<HomePage_Cubit>().noteLoad();
              },
            );
          },
          child: const Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}
