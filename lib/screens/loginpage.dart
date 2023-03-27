import 'package:claysys_portal/blocs/app_theme/theme_bloc.dart';
import 'package:claysys_portal/blocs/app_theme/theme_state.dart';
import 'package:claysys_portal/blocs/imp_contacts/contacts_bloc.dart';
import 'package:claysys_portal/screens/homepage.dart';
import 'package:claysys_portal/screens/widget_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import '../app_theme.dart';


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerDelegate: _router.routerDelegate,
    routeInformationParser: _router.routeInformationParser,
    routeInformationProvider: _router.routeInformationProvider,
  );

    final GoRouter _router = GoRouter(
        routes: <GoRoute>[
          GoRoute(
              routes: <GoRoute>[
                GoRoute(
                  path: 'homepage',
                  builder: (BuildContext context, GoRouterState state)=>
                  const MyHome(),
                ),
              ],
            path: '/',
            builder: (BuildContext context, GoRouterState state) =>
                const MyApp1(),
          ),
        ],
    );
  }

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactsBloc(),),
        BlocProvider(create: (context) => SwitchBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}


Widget InputField(String name,IconData  icon, Key key) {
  return  Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    margin: const EdgeInsets.only(left: 20,right: 20,bottom: 18),
    child: TextFormField(
      key: key,
      decoration:  InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: const Color(0xFFe3eaf0),
        labelText: name,
        labelStyle: const TextStyle(fontWeight:FontWeight.w500, fontSize: 15,color: Colors.black54),
        prefixIcon: Icon(
          icon,
          color: Colors.black54,
          size: 30,
        ),
      ),
    ),
  );
}


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {    
    super.initState();    
    Future.delayed(Duration.zero, () async {      
      await Permission.notification.request();   
      await Permission.camera.request();
      });  
      }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    
    final router = GoRouter.of(context);

    return Scaffold(
        backgroundColor: const Color(0xFFf4f8fa),
        body: SingleChildScrollView(
          child:Center(
              child : Form(
                key: formkey,
                child:  Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top:190,bottom:40),
                        alignment: Alignment.center,
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    InputField('EMPLOYEE ID',Icons.person_outline,emailKey),
                    InputField('PASSWORD',Icons.lock_outline,passwordKey),
                    Container(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        margin: const EdgeInsets.only(left: 20,right: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF26b860),
                              fixedSize: const Size(400, 60)),
                          onPressed: () {
                            context.go('/homepage');
                          },
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: const Text(
                        'Forgot Username or Password?',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 135),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Don\'t have an account',
                            style:
                            TextStyle(fontSize: 15, color: Colors.black38,fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            child: const Text(
                              'Register Now',
                              style: TextStyle(fontSize: 15, color: Colors.blue,fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
             )
          ),
       )
    );
  }
}


class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchBloc(),
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.switchValue
                ? AppTheme.darkTheme : AppTheme.lightTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}


// status() async{  
//   var notification_status = await Permission.notification.status;  
//   print(notification_status);  
//   if(notification_status != PermissionStatus.granted)
//   {   
//     await Permission.notification.request();   
//     print(notification_status);  
//     }  
//   else 
//   {    
//     print("granted");  
//     }
//     }