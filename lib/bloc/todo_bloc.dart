import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events
abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String task;
  AddTodo(this.task);
}

class RemoveTodo extends TodoEvent {
  final int index;
  RemoveTodo(this.index);
}

// Define the state
class TodoState {
  final List<String> todos;
  TodoState(this.todos);
}

// Define the BLoC
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState([])) {
    on<AddTodo>((event, emit) {
      final updatedTodos = List<String>.from(state.todos)..add(event.task);
      emit(TodoState(updatedTodos));
    });

    on<RemoveTodo>((event, emit) {
      final updatedTodos = List<String>.from(state.todos)..removeAt(event.index);
      emit(TodoState(updatedTodos));
    });
  }
} 