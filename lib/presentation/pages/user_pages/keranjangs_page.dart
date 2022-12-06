import 'package:flutter/material.dart';
import 'package:waroengku/presentation/pages/admin_pages/admin_edit_katalog.dart';
import 'package:waroengku/presentation/pages/user_pages/success_page.dart';
import 'package:waroengku/share/styles/colors.dart';

class KeranjangsPage extends StatefulWidget {
  const KeranjangsPage({super.key});

  @override
  State<KeranjangsPage> createState() => _KeranjangsPageState();
}

class _KeranjangsPageState extends State<KeranjangsPage> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessPage()));
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: const Text(
                      "Keranjang Saya",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3,
                              offset: Offset(0.7, 1),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: kPrimaryColor,
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool;
                                });
                              },
                            ),
                            Image.asset(
                              "assets/images/pulen-removebg-preview 1.png",
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: const Text(
                                      "Beras Pandan Wangi",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Rp. 27. 500",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 10),
                                          child: const Text(
                                            "-",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: kPrimaryColor),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 10),
                                          child: const Text(
                                            "1",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: kPrimaryColor),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 10),
                                          child: const Text(
                                            "+",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: kPrimaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3,
                              offset: Offset(0.7, 1),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: kPrimaryColor,
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool;
                                });
                              },
                            ),
                            Image.asset(
                              "assets/images/pulen-removebg-preview 1.png",
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: const Text(
                                      "Beras Pandan Wangi",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Rp. 27. 500",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 10),
                                          child: const Text(
                                            "-",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: kPrimaryColor),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 10),
                                          child: const Text(
                                            "1",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: kPrimaryColor),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 10),
                                          child: const Text(
                                            "+",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: kPrimaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 260,
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Rp. 0",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 180,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditKatalog()));
                            },
                            child: Text(
                              "Checkout",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              height: 100,
              decoration: const BoxDecoration(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
