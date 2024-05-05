import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage_Cubit extends Cubit<void>{
  RegisterPage_Cubit():super(0);

  var krepo = UsersDaoRepository();

  Future<void> Save(String name, String telephone) async{
    await krepo.Save(name, telephone);
  }
}