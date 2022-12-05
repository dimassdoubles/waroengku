import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waroengku/domain/usecases/pick_image.dart';
import 'package:waroengku/injection_container.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/blocs/product/product_bloc.dart';
import 'package:waroengku/presentation/blocs/product/product_event.dart';
import 'package:waroengku/presentation/blocs/product/product_state.dart';
import 'package:waroengku/share/styles/colors.dart';

class TambahKatalog extends StatefulWidget {
  const TambahKatalog({super.key});

  @override
  State<TambahKatalog> createState() => _TambahKatalogState();
}

class _TambahKatalogState extends State<TambahKatalog> {
  File? image;

  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController stockController;
  late TextEditingController descriptionController;

  AuthBloc authBloc = getIt<AuthBloc>();
  ProductBloc productBloc = getIt<ProductBloc>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    categoryController = TextEditingController();
    stockController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    categoryController.dispose();
    stockController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  //show popup dialog option pick image
  void chooseImageSource() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('Please choose media to select'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  //if user click this button, user can upload image from gallery
                  onPressed: () async {
                    Navigator.pop(context);
                    final imagePicked = await pickImage(context);
                    if (imagePicked != null) {
                      setState(() {
                        image = imagePicked;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.image),
                      SizedBox(
                        width: 4,
                      ),
                      Text('From Gallery'),
                    ],
                  ),
                ),
                ElevatedButton(
                  //if user click this button. user can upload image from camera
                  onPressed: () async {
                    Navigator.pop(context);
                    final imagePicked = await pickImage(context, camera: true);
                    if (imagePicked != null) {
                      setState(() {
                        image = imagePicked;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.camera_alt_rounded),
                      SizedBox(
                        width: 4,
                      ),
                      Text('From Camera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Tambah Katalog",
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder(
        bloc: authBloc,
        builder: (context, authState) {
          if (authState is Authenticated) {
            return BlocListener(
              bloc: productBloc,
              listener: (context, productState) {
                if (productState is ProductOnload) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (productState is ProductUnload) {
                  print("pop disini");
                  Navigator.pop(context);
                }
              },
              child: SingleChildScrollView(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // gambar produk
                    InkWell(
                      onTap: () {
                        chooseImageSource();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        width: double.infinity,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: (image == null)
                              ? Container(
                                  color: Colors.grey[300],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.camera_alt_rounded,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Tambah Gambar Produk",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Nama Produk",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  cursorColor: kPrimaryColor,
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Nama Produk"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Kategori Produk",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  cursorColor: kPrimaryColor,
                                  controller: categoryController,
                                  decoration: const InputDecoration(
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
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Stock",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  cursorColor: kPrimaryColor,
                                  controller: stockController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "200"),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Deskripsi",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  maxLines: 8,
                                  cursorColor: kPrimaryColor,
                                  controller: descriptionController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText:
                                        "Silahkan masukan deskripsi product.",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              print(nameController.text);
                              print(stockController.text);
                              print(descriptionController.text);
                              int categoryId = 85;
                              if (image != null) {
                                productBloc.add(
                                  ProductCreate(
                                    token: authState.user.token,
                                    name: nameController.text,
                                    description: descriptionController.text,
                                    categoryId: categoryId,
                                    stock: 200,
                                    price: 100000,
                                    image: image!,
                                  ),
                                );
                              } else {
                                chooseImageSource();
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  "Simpan Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
