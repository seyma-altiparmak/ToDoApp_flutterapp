import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutterapp/data/entity/todo.dart';
import 'package:todoapp_flutterapp/data/repo/TodoDaoRepository.dart';

class HomePage_Cubit extends Cubit<List<ToDo>>{
  HomePage_Cubit():super(<ToDo>[]);

  var krepo = ToDoDaoRepository();

  Future<void> noteLoad() async {
    var list = await krepo.noteLoad();
    emit(list);
  }

  Future<void> search(String searchWord) async {
    var list = await krepo.search(searchWord);
    emit(list);
  }

  Future<void> delete(int id) async {
    await krepo.delete(id);
    await noteLoad();
  }
}