import 'package:flutter/material.dart';
import 'package:simple_blog/models/account_model.dart';
import 'package:simple_blog/repositories/accountRepository.dart';
import 'package:validate/validate.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState() {
    _repository = new AccountRepository();
  }

  AccountRepository _repository;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }

    return null;
  }

  submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      _repository.login(_data.email, _data.password).then((result) {
        if (result == null) {
          var snackbar = SnackBar(
            content: Text("Email or password is wrong"),
          );
          Scaffold.of(_formKey.currentContext).showSnackBar(snackbar);
        } else {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      });
    }
  }

  test() async {
    var account =
        new Account(email: "ad@min.com", firstName: "Test", lastName: "User");
    var user = await _repository.login("ad@min.com", "");
    if (user == null) user = await _repository.create(account);

    var snackbar = SnackBar(
      content: Text("Now try with 'ad@min.com' email"),
    );
    Scaffold.of(_formKey.currentContext).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                    keyboardType: TextInputType
                        .emailAddress, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'you@example.com',
                        labelText: 'E-mail Address'),
                    validator: this._validateEmail,
                    onSaved: (String value) {
                      this._data.email = value;
                    }),
                new TextFormField(
                    obscureText: true, // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Password', labelText: 'Enter your password'),
                    validator: this._validatePassword,
                    onSaved: (String value) {
                      this._data.password = value;
                    }),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Login',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: this.submit,
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Test',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: this.test,
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}
