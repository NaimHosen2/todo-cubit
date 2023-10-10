import 'package:flutter_bloc/flutter_bloc.dart';

part 'to_do_state.dart';

class Todo {
  static List<String> data = [
        'My name is Md.Naim Hosen',
        'My fathers name is Md.Ashraful Islam',
        'My mathers name is Most:Nazma Begum',
        'I come from Rangpur',
  ];
}

class ToDoCubit extends Cubit<ToDoInitial> {
  ToDoCubit() : super(ToDoInitial(todos: Todo.data));

  addTodo(String todo) {
    final todoList = state.todos;
    todoList.add(todo);
    emit(ToDoInitial(todos: todoList));
  }

  deletetodo(int indext) {
    final todoList = state.todos;
    todoList.removeAt(indext);
    emit(ToDoInitial(todos: todoList));
  }
}
