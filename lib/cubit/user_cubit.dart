import 'package:bloc/bloc.dart';
import 'package:collection_store/data/accout.dart';
import 'package:collection_store/data/collections.dart';
import 'package:collection_store/data/items.dart';

class UserCubit extends Cubit<Account> {
  UserCubit() : super(user); 

  //Function here
  void update() {
    emit(state);
  }

  void addCol(Collection col){
    state.addcollection(col);
  }

  void additem(Item it, int colindex){
    state.additem(it, colindex);
  }
}
