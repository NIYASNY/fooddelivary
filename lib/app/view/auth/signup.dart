import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/auth/signin.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/auth/widgets/agriment.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/auth/widgets/auth_filed.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/auth/widgets/primary_button.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/auth/widgets/socialbutton.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/auth/widgets/text_divider.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/home/home_screen.dart';
import 'package:flutter_ecommercedeliveryapp/utils/colors.dart';
import 'package:flutter_ecommercedeliveryapp/utils/constants/app_colors.dart';
import 'package:flutter_ecommercedeliveryapp/utils/constants/image_path.dart';
import '../../controller/signup/bloc/signup_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  SignupBloc signupBloc = SignupBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorspage.kWhite,
      appBar: AppBar(
          backgroundColor: Colorspage.kWhite,
          elevation: 0,
          leading: const BackButton(
            color: Colorspage.kPrimary,
          )),
      body: BlocConsumer<SignupBloc, SignupState>(
        bloc: signupBloc,
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else if (state is SignUpErrorState) {
            showErrorSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    const Text('Create Account',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),

                    const SizedBox(height: 35),
                    // FullName.
                    AuthField(
                      hintText: 'Enter your name',
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    // Email Field.
                    AuthField(
                      hintText: 'Enter your email address',
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    AuthField(
                      hintText: 'Enter your Phone number',
                      controller: _numberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    // Password Field.
                    AuthField(
                      hintText: 'Enter your password',
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colorspage.kGrey70),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignIn()));
                                  },
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colorspage.kPrimary),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          signupBloc.add(SignUpButtonPressedEvent(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              mobile: _numberController.text,
                              context: context));
                        }
                      },
                      text: 'Create An Account',
                    ),
                    const SizedBox(height: 30),
                    const TextWithDivider(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomSocialButton(
                          onTap: () {},
                          icon: AssetImagepath.kGoogle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const AgreeTermsTextCard(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
