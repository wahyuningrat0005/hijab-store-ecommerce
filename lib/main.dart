import 'package:e_commerce/data/datasources/auth_local_datasource.dart';
import 'package:e_commerce/presentation/auth/bloc/login/login_bloc.dart';
import 'package:e_commerce/presentation/auth/bloc/register/register_bloc.dart';
import 'package:e_commerce/presentation/auth/login_page.dart';
import 'package:e_commerce/presentation/dashboard/dashboard_page.dart';
import 'package:e_commerce/presentation/home/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(create: (context) => ProductsBloc()..add(const ProductsEvent.getAll()),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(future: AuthLocalDatasource().isLogin(),
        builder: (context, snapshot) {
          if(snapshot.data != null && snapshot.data!){
            return const DashboardPage();
          }else{
            return const LoginPage();
          }
        },
      ),
      ),
    );
  }
}
