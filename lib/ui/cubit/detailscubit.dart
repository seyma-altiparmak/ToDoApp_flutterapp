import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage_Cubit extends Cubit<void>{
  DetailsPage_Cubit():super(0);

  var krepo = to();

  Future<void> UpdateUser(int id,String name, String telephone) async{
    await krepo.UpdateUser(id, name, telephone);
  }
}