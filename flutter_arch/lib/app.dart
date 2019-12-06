import 'package:flutter/material.dart';
import 'package:flutter_arch/arch/redux/middleware/store_login_middleware.dart';
import 'package:flutter_arch/arch/redux/model/app_state.dart';
import 'package:flutter_arch/arch/redux/page/page_redux.dart';
import 'package:flutter_arch/arch/redux/reducer/reducer_app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ArchApp extends StatelessWidget {
  // Needed ONLY for REDUX example
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.noLoggedUser(),
    middleware: createStoreLoginMiddleware(),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Architecture Comparison Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            //ProviderExamplePage(title: 'Provider: Architecture Comparison Demo'),
            //BlocExamplePage(title: 'Provider: Architecture Comparison Demo'),
            ReduxExamplePage(title: 'Redux: Architecture Comparison Demo'),
      ),
    );
  }
}
