import 'package:blog_learn_2/core/common/widgets/loader.dart';
import 'package:blog_learn_2/core/theme/app_pallete.dart';
import 'package:blog_learn_2/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_learn_2/feature/auth/presentation/pages/login_page.dart';
import 'package:blog_learn_2/feature/auth/presentation/widgets/auth_feild.dart';
import 'package:blog_learn_2/feature/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state is AuthFailure) {

    }
  },
  builder: (context, state) {
    if (state is AuthLoading) {
      const Loader();
    }
    return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign up.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthFeild(
                hintText: 'Name',
                controller: nameController,
              ),
              const SizedBox(
                height: 30,
              ),
              AuthFeild(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 30,
              ),
              AuthFeild(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              AuthGradientButton(
                buttonText: 'Sign up',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                      AuthSignupEvent(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text
                      )
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: "Already have an account?  ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: 'Sign in',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                color: AppPallete.gradient2,
                                fontWeight: FontWeight.bold))
                      ]),
                ),
              )
            ],
          ),
        );
  },
),
      ),
    );
  }
}
