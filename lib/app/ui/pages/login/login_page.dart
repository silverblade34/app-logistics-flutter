import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:logis02app/app/controllers/login_controller.dart';
import 'package:logis02app/app/ui/utils/style_utils.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  constraints:
                      const BoxConstraints.expand(height: 150, width: 120),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset(
                    pathLogoLogin,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  constraints: const BoxConstraints.expand(height: 25),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    "Logistics v2",
                    style: TextStyle(
                      fontSize: H4,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<LoginController>(builder: (loginCntl) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        constraints: const BoxConstraints.expand(height: 50),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: loginCntl.unidadcntll,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text(
                              "Móvil",
                              style: TextStyle(fontSize: P1),
                            ),
                            prefixIcon: Icon(
                              Iconsax.mobile,
                              size: 20,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => Container(
                          constraints: const BoxConstraints.expand(height: 50),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            obscureText: loginCntl.obscurePass.value,
                            controller: loginCntl.clavecntll,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              label: const Text(
                                "Clave Móvil",
                                style: TextStyle(fontSize: P1),
                              ),
                              prefixIcon: const Icon(
                                Iconsax.lock,
                                size: 20,
                                color: Color.fromARGB(255, 116, 116, 116),
                              ),
                              suffix: InkWell(
                                onTap: () {
                                  loginCntl.obscurePass.value =
                                      !loginCntl.obscurePass.value;
                                },
                                child: const Icon(
                                  Icons.remove_red_eye,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 45),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(INFO)),
                          onPressed: () async {
                            await loginCntl.loginByCred();
                            // await loginCntl.testUploadFile();
                          },
                          child: const Text(
                            "Ingresar",
                            style: TextStyle(fontSize: P1, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
