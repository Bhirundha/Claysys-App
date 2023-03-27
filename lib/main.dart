import 'package:claysys_portal/blocs/imp_contacts/contacts_bloc.dart';
import 'package:claysys_portal/screens/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/home_widget.dart';
import 'package:home_widget/home_widget_callback_dispatcher.dart';
import 'package:workmanager/workmanager.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ContactsBloc(),
      ),
    ],
    child: MyApp(),
  ),
  );
}

// @pragma("vm:entry-point")
// Future<void> backgroundCallback(Uri? uri) async {
//   await HomeWidget.saveWidgetData<String>('designation', job);
//   await HomeWidget.saveWidgetData<String>('experience', exp);
//   await HomeWidget.saveWidgetData<String>('detail', info);
//   await HomeWidget.updateWidget(
//       name: 'HomeWidgetExampleProvider', iOSName: 'HomeWidgetExample');
// }

// List job=[];
// String? exp;
// String? info;