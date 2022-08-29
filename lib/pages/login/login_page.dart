import 'package:curso_app/models/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../utils/validators.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/signup");
            },
            textColor: Colors.white,
            child: const Text(
              "CRIAR CONTA",
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
        title: const Text("Entrar"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManeger, __) {
                return ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: <Widget>[
                      TextFormField(
                        enabled: !userManeger.loading,
                        controller: emailController,
                        decoration: const InputDecoration(helperText: 'E-mail'),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email) {
                          if (email == null) return "E-mail inválido";
                          if (!emailValid(email)) return "E-mail inválido";
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        enabled: !userManeger.loading,
                        controller: passController,
                        decoration: const InputDecoration(helperText: 'Senha'),
                        autocorrect: false,
                        obscureText: true,
                        validator: (pass) {
                          if (pass == null) return "senha inválida";
                          if (pass.isEmpty || pass.length < 6) {
                            return "senha inválida";
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: const Text("Esqueci minha senha"),
                        ),
                      ),
                      SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed: userManeger.loading
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    userManeger.signIn(
                                        user: User(
                                          email: emailController.text,
                                          password: passController.text,
                                        ),
                                        onFail: (e) {
                                          scaffoldKey.currentState!
                                              .showSnackBar(SnackBar(
                                            backgroundColor: Colors.red,
                                            duration:
                                                const Duration(seconds: 5),
                                            content: Text(e.toString()),
                                          ));
                                        });
                                  }
                                },
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          disabledColor: Theme.of(context).primaryColor,
                          child: userManeger.loading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text(
                                  "Entrar",
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      )
                    ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
