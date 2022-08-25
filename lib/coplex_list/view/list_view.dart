import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../comple_list.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.watch<ListBloc>().state;

    switch (state.status) {
      case ListStateStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case ListStateStatus.initial:
        return const Center(
          child: Text('Wait we are loding data'),
        );

      default:
        return _ListItem(state.list);
    }
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem(this._list);
  final List<Item> _list;
  @override
  Widget build(BuildContext context) {
    return _list.isEmpty
        ? const Center(
            child: Text('No Item element found'),
          )
        : ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return _ListChildItem(
                  item: _list[index],
                  ondeletePressed: (id) {
                    context.read<ListBloc>().onDeleteItem(id);
                  });
            });
  }
}

class _ListChildItem extends StatelessWidget {
  const _ListChildItem({required this.item, required this.ondeletePressed});
  final Item item;
  final ValueSetter<int> ondeletePressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text('${item.index}'),
        title: Text(item.value),
        trailing: item.isDeleting
            ? const CircularProgressIndicator()
            : IconButton(
                onPressed: () => ondeletePressed(item.index),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
      ),
    );
  }
}
