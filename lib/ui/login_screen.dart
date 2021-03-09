import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:relief/blocs/login/login_cubit.dart';
import 'package:relief/blocs/login/login_states.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CubitConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(body: Center(child: Text('Login')));
        },
        listener: (context, state) {},
      ),
    );
  }
}
