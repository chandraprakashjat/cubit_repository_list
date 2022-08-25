part of 'list_bloc.dart';

enum ListStateStatus { initial, loading, success, failure, deleting, deleted }

class ListState extends Equatable {
  const ListState(
      {this.list = const <Item>[], this.status = ListStateStatus.initial});
  final List<Item> list;
  final ListStateStatus status;

  ListState copyWith({List<Item>? list, ListStateStatus? status}) {
    return ListState(list: list ?? this.list, status: status ?? this.status);
  }

  @override
  List<Object> props() => [list, status];
}



/* Without Copy With 
*
class MyState extends Equatable {
  const MyState._(
      {this.item = const <Item>[], this.stateStatus = ListStateStatus.initial});
  final List<Item> item;
  final ListStateStatus stateStatus;

  const MyState.loading() : this._(stateStatus: ListStateStatus.loading);

  const MyState.success(List<Item> item)
      : this._(stateStatus: ListStateStatus.success, item: item);

  const MyState.failure() : this._(stateStatus: ListStateStatus.failure);

  const MyState.initial() : this._(stateStatus: ListStateStatus.initial);
  @override
  List<Object?> props() => [item, stateStatus];

 
} **/
