import 'package:carros_app/domain/login_service.dart';
import 'package:carros_app/utils/alerts.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final loginController = TextEditingController(text:"");
  final senhaController = TextEditingController(text:"");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();// permite criar funções para validar login e a senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _body(context),
      ),
    );
  }

  String _validateLogin(String text){

    if(text.isEmpty){
        return "Informe o login";
    }
    return null;

  }

  String _validateSenha(String text){

    if(text.isEmpty){
      return "Informe a senha";
    }
    if(text.length<=2){
      return "Senha precisa ter mais de 2 números ";

    }
    return null;

  }

  Widget _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: loginController,
            validator: _validateLogin,
            style: TextStyle(
                color: Colors.blue, fontSize: 25), // design das letras do input
            decoration: InputDecoration(
                labelText: 'Login',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25.0),
                hintText: "Digite o seu login", // design do label
                hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          TextFormField(
            controller: senhaController,
            validator: _validateSenha,
            obscureText: true, // para mostrar as bolinhas na senha
            style: TextStyle(
                color: Colors.blue, fontSize: 25), // design das letras do input
            decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25.0),
                hintText:
                    "Digite a sua senha", // design da dica que fica no label
                hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          Container(
            height: 50.0,// altura do login
            margin: EdgeInsets.only(top: 20.0),// espaçamento de cima do input de senha e
            child: RaisedButton(
            color: Colors.blue,

            child: Text("Login",
            style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
                onPressed: () {_onClickLogin(context);}
            ),

          ),
        ],
      ),
    );
  }

  void _onClickLogin(BuildContext context) async {

    final login = loginController.text;
    final senha = senhaController.text;

    print('Login: $login, senha:$senha ');

    // se a validação não estiver sendo feita pelo validator, retorne null
   if(!_formKey.currentState.validate()){
      return;
    }

    final testValidationResponse= await LoginService.login(login,senha);


    if(testValidationResponse.isOk()){
      print("Entrar na home !!!");
    } else {
      // import do pacote utils da classe alerts
      alert(context,"Error","Ocorreu um erro no login");
    }

 /*   if(login.isEmpty || senha.isEmpty){

    }
*/

  }
}
