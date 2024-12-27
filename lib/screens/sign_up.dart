import 'package:flutter/material.dart';
import 'package:login_signup_task/screens/login.dart';
import 'package:login_signup_task/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../providers/registeration_provider.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var registrationProviderObject =
        Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Signup",
            style: TextStyle(fontSize: 24),
          ),
        ),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
                controller: nameController,
                label: "User Name",
                suffixIcon: Icon(Icons.person),
                textInputType: TextInputType.text),
            CustomTextFormField(
                controller: phoneController,
                label: "Phone",
                suffixIcon: Icon(Icons.phone),
                textInputType: TextInputType.number),
            CustomTextFormField(
              controller: emailController,
              label: "Email",
              suffixIcon: Icon(Icons.email),
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              controller: passwordController,
              label: "Password",
              suffixIcon: Icon(Icons.lock),
              obscureText: true,
              textInputType: TextInputType.text,
            ),

            const SizedBox(height: 10),
            // Signup button
            TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await registrationProviderObject.signUpDataProvider(
                        email: emailController.text,
                        password: passwordController.text,
                      name: nameController.text,
                      phone: phoneController.text,

                    );
                  }
                  if (registrationProviderObject.registrationModel?.status ==
                      true) {
                    print(registrationProviderObject
                        .registrationModel?.message);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  }
                },
                child: Text("Login")),
            // Already have an account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Return to login page
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
