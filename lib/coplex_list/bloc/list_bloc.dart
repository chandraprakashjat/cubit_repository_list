import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../comple_list.dart';

part 'list_state.dart';

class ListBloc extends Cubit<ListState> {
  final Repository repository;
  ListBloc({required this.repository}) : super(const ListState());

  onLoadDataList() async {
    try {
      //emit Loading state
      emit(state.copyWith(status: ListStateStatus.loading));

      //Get data List

      var list = await repository.loadItemList();

      //Emit success State

      emit(state.copyWith(list: list, status: ListStateStatus.success));
    } catch (error) {
      emit(state.copyWith(status: ListStateStatus.failure));
    }
  }

  onDeleteItem(int itemNumber) async {
    //Emit deleting state
    print('onDelete $itemNumber');
    state.list.firstWhere((element) => element.index == itemNumber).isDeleting =
        true;

    emit(state.copyWith(list: state.list, status: ListStateStatus.deleting));
    //Delete Item Process

    await repository.delteItem();

    //Success delete state
    state.list.removeWhere((item) => item.index == itemNumber);
    emit(state.copyWith(list: state.list, status: ListStateStatus.deleted));
  }
}
