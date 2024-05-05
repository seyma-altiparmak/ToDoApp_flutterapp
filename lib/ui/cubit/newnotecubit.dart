import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutterapp/data/repo/TodoDaoRepository.dart';

class NewNote_Cubit extends Cubit<void>{
  NewNote_Cubit():super(0);

  var krepo = ToDoDaoRepository();

  Future<void> Save(String note) async{
    await krepo.Save(note);
  }
}