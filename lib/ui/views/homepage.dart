import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutterapp/data/entity/todo.dart';
import 'package:todoapp_flutterapp/ui/views/details.dart';

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
    context.read<HomePage_Cubit>().userLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: isInSearch
              ? TextField(
            decoration: const InputDecoration(hintText: "Search"),
            onChanged: (searchResult) {
              context.read<HomePage_Cubit>().search(searchResult);
            },
          )
              : const Text("USERS"),
          actions: [
            isInSearch
                ? IconButton(
                onPressed: () {
                  setState(() {
                    isInSearch = false;
                  });
                  context.read<HomePage_Cubit>().userLoad();
                },
                icon: const Icon(Icons.clear))
                : IconButton(
                onPressed: () {
                  setState(() {
                    isInSearch = true;
                  });
                },
                icon: const Icon(Icons.search)),
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
                                builder: (context) => Details(todo: k)))
                            .then((value) {
                          context.read<HomePage_Cubit>().userLoad();
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
                                        "${k.todo_id} 'll delete u want continue?",
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
                                color: Colors.black38,
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
                context.read<HomePage_Cubit>().userLoad();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
