import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutterapp/data/repo/TodoDaoRepository.dart';

class DetailsPage_Cubit extends Cubit<void>{
  DetailsPage_Cubit():super(0);

  var krepo = ToDoDaoRepository();

  Future<void> UpdateNote(int id,String note) async{
    await krepo.UpdateNote(id, note);
  }
}