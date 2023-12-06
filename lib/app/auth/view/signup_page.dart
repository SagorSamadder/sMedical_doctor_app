import 'package:s_medical_doctors/general/consts/consts.dart';

import '../../home/view/home.dart';
import '../../widgets/coustom_textfield.dart';
import '../../widgets/loading_indicator.dart';
import '../controller/signup_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignupController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    AppAssets.imgWelcome,
                    width: context.screenHeight * .23,
                  ),
                  8.heightBox,
                  AppString.signupNow.text
                      .size(AppFontSize.size18)
                      .semiBold
                      .make()
                ],
              ),
              15.heightBox,
              Form(
                  key: controller.formkey,
                  child: Column(
                    children: [
                      CoustomTextField(
                        textcontroller: controller.nameController,
                        hint: AppString.fullName,
                        icon: const Icon(Icons.person),
                        validator: controller.validname,
                      ),
                      15.heightBox,
                      CoustomTextField(
                        textcontroller: controller.emailController,
                        icon: const Icon(Icons.phone),
                        hint: "Enter your phone number",
                      ),
                      15.heightBox,
                      CoustomTextField(
                        textcontroller: controller.emailController,
                        icon: const Icon(Icons.email_rounded),
                        hint: AppString.emailHint,
                        validator: controller.validateemail,
                      ),
                      15.heightBox,
                      CoustomTextField(
                        textcontroller: controller.passwordController,
                        icon: const Icon(Icons.key),
                        hint: AppString.passwordHint,
                        validator: controller.validpass,
                      ),
                      20.heightBox,
                      GestureDetector(
                        onTapDown: (details) {
                          controller.showDropdownMenu(context);
                        },
                        child: TextFormField(
                          controller: controller.textEditingController,
                          readOnly: true,
                          onTap: () {
                            controller.showDropdownMenu(context);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Select Category',
                            prefixIcon: Icon(Icons.more_vert),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          ),
                        ),
                      ),
                      15.heightBox,
                      CoustomTextField(
                        icon: const Icon(Icons.document_scanner),
                        hint: "write your servise time",
                      ),
                      15.heightBox,
                      CoustomTextField(
                        icon: const Icon(Icons.document_scanner),
                        hint: "write some thing yourself",
                      ),
                      15.heightBox,
                      CoustomTextField(
                        icon: const Icon(Icons.home_rounded),
                        hint: "write your address",
                      ),
                      15.heightBox,
                      CoustomTextField(
                        icon: const Icon(Icons.type_specimen),
                        hint: "write some thing about your service",
                      ),
                      20.heightBox,
                      SizedBox(
                        width: context.screenWidth * .7,
                        height: 44,
                        child: Obx(
                          () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primeryColor,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () async {
                              await controller.signupUser(context);
                              if (controller.userCredential != null) {
                                Get.offAll(() => const Home());
                              }
                            },
                            child: controller.isLoading.value
                                ? const LoadingIndicator()
                                : AppString.signup.text.white.make(),
                          ),
                        ),
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppString.alreadyHaveAccount.text.make(),
                          8.widthBox,
                          AppString.login.text.make().onTap(() {
                            Get.back();
                          }),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
