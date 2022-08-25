import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coplex_list/comple_list.dart';

class MyApp extends MaterialApp {
  MyApp({super.key})
      : super(
            home: BlocProvider(
          create: (context) => ListBloc(repository: context.read<Repository>())
            ..onLoadDataList(),
          child: Scaffold(
            appBar: AppBar(title: const Text('List with Repository')),
            body: const ListViewWidget(),
          ),
        ));
}
