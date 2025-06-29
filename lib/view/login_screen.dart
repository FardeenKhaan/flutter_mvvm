import 'package:flutter/material.dart';
import 'package:flutter_mvvm/res/components/rounded_button.dart';
import 'package:flutter_mvvm/utils/routes/routes.dart';
import 'package:flutter_mvvm/utils/utils.dart';
import 'package:flutter_mvvm/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewmodel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                hintText: "Enter Email",
                prefixIcon: const Icon(Icons.email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldfocusNode(
                  context,
                  emailFocusNode,
                  passwordFocusNode,
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obscurePassword,
              builder:
                  (context, value, child) => TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _obscurePassword.value,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                      ),
                    ),
                  ),
            ),

            RoundedButton(
              title: "Login",
              isLoading: authViewModel.loading,
              onPressed: () {
                // Utils.flushBarErrorMessage("Login Button Clicked", context);
                // Utils.toastMessage("Login Button Clicked");
                // Navigator.pushNamed(context, RoutesName.home);
                if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please enter email", context);
                } else if (passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please enter password", context);
                } else {
                  Map data = {
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString(),
                  };
                  authViewModel.loginApi(data, context);
                  // Utils.toastMessage("Login Successful");
                  // Navigator.pushNamed(context, RoutesName.home);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
