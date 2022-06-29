import 'package:counter_bloc/loggedin.dart';
import 'package:counter_bloc/login_bloc.dart';
import 'package:counter_bloc/login_events.dart';
import 'package:counter_bloc/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your username",
                ),
                controller: _userController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                ),
                controller: _passwordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  loginBloc.add(OnLoginEvent(
                      user: _userController.text,
                      password: _passwordController.text));
                },
                child: const Text("Sign In"),
              ),
            ),
            BlocConsumer<LoginBloc, LoginState>(
              bloc: loginBloc,
              listener: (BuildContext context, LoginState state) {
                if (state is LoginLoadedState) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Logado()));
                }
              },
              builder: (BuildContext context, LoginState state) {
                if (state is LoginErrorState) {
                  return const Text("Error");
                } else if (state is LoginLoadingState) {
                  return const CircularProgressIndicator();
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
