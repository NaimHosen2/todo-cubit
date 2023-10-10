import 'package:bloc_cubit/to_do_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo Cubit'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _controller,
            ),
          ),
          SizedBox(width: 300,
          child:ElevatedButton(onPressed:  ()=>BlocProvider.of<ToDoCubit>(context).addTodo(_controller.text), child: Text('Add New Todo'))
          ),
          Expanded(
            child: BlocBuilder<ToDoCubit, ToDoInitial>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                    itemBuilder: (_, index){
                    return Card(
                      child: ListTile(
                        title: Text(state.todos[index]),
                        leading:
                       IconButton(
                          onPressed: ()=>BlocProvider.of<ToDoCubit>(context).deletetodo(index), icon: Icon(
                         Icons.remove_circle,
                       )
                        )
                      ),
                    );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
