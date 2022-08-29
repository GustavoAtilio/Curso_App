import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../utils/validators.dart';

class Signup extends StatelessWidget {
  final User user = User();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Criar conta"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  TextFormField(
                    onSaved: (value) => user.nome = value,
                    decoration:
                        const InputDecoration(hintText: "Nome completo"),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (email == null) return "Nome inválido";
                      if (email.isEmpty) return "Nome inválidoinválido";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    onSaved: (value) => user.email = value,
                    decoration: const InputDecoration(hintText: "Email"),
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
                    onSaved: (value) => user.password = value,
                    decoration: const InputDecoration(hintText: "Senha"),
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
                  const SizedBox(height: 16),
                  TextFormField(
                    onSaved: (value) => user.confirmPassword = value,
                    decoration:
                        const InputDecoration(hintText: "Repita a senha"),
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
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (user.password != user.password) {
                            scaffoldKey.currentState!
                                .showSnackBar(const SnackBar(
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 5),
                              content: Text("Senha não coincidem!"),
                            ));
                            return;
                          }
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      disabledColor: Theme.of(context).primaryColor,
                      child: const Text(
                        "Criar Conta",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
