import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();

  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";

  submit() {
    bool isValidated = formKey.currentState!.validate();

    if (isValidated) {
      formKey.currentState!.save();
      print(firstName);
      print(lastName);
      print(email);
      print(password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(21),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      label: const Text('First Name'),
                      hintText: 'Enter your First Name',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'First Name should not be Empty';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    firstName = value.toString();
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: const Text('Last Name'),
                      hintText: 'Enter your Last Name',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Last Name should not be Empty';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    lastName = value.toString();
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: const Text('Email'),
                      hintText: 'Enter your Email',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Email should not be Empty';
                    } else {
                      if (value.toString().contains('@')) {
                        return null;
                      } else {
                        return 'Enter a valid Email Address';
                      }
                    }
                  },
                  onSaved: (value) {
                    email = value.toString();
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                      label: const Text('Password'),
                      hintText: 'Enter Password',
                      suffixIcon: GestureDetector(
                          onTap: () {
                            if (isPasswordVisible) {
                              isPasswordVisible = false;
                            } else {
                              isPasswordVisible = true;
                            }

                            setState(() {});
                          },
                          child: const Icon(Icons.visibility)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                  validator: (value) {
                    if (value.toString().length < 8) {
                      return 'Password should contain atleast 8 characters';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    password = value.toString();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: submit, child: const Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
