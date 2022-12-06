import 'package:flutter/material.dart';
import 'package:waroengku/presentation/pages/admin_pages/tambah_katalog.dart';
import 'package:waroengku/share/styles/colors.dart';

import '../user_pages/success_page.dart';

class EditKatalog extends StatefulWidget {
  const EditKatalog({super.key});

  @override
  State<EditKatalog> createState() => _EditKatalogState();
}

class _EditKatalogState extends State<EditKatalog> {
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
                                builder: (context) => const SuccessPage()));
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
                      "Edit Katalog",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/pulen-removebg-preview 1.png",
                      scale: 1,
                    ),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Nama Produk",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Nama Produk"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Kategori Produk",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Kategori Produk"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Stock",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), hintText: "200"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Deskripsi",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          maxLines: 8,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText:
                                  "Beras Hoki merupkan beras bibit Unggul pilihan dari hasil petani indonesia, diproses dengan teknologi yang modern dan higenish sehingga  menghasilkan beras berkualitas baik dan bergizi"),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 110,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditKatalog()));
                        },
                        child: InkWell(
                           onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TambahKatalog()));
                            },
                                                  child: Text(
                              "Ubah Data",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                           color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                        ),
                      ),
                    ),
                    height: 40,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
