import 'package:cubit_repository_list/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coplex_list/comple_list.dart';

void main() {
  runApp(RepositoryProvider(
    create: (_) => Repository(),
    child: MyApp(),
  ));
}
