import 'package:bloc/bloc.dart';
import 'package:collection_store/data/accout.dart';
import 'package:collection_store/data/collections.dart';

class UserCubit extends Cubit<Account> {
  UserCubit() : super(user); 

  //Function here
  void addCol(Collection col){
    state.addcollection(col);
  }
}
