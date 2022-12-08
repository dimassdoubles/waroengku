import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/pick_image.dart';
import '../../../domain/usecases/string_extension.dart';
import '../../../injection_container.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_state.dart';
import '../../blocs/category/cat_bloc.dart';
import '../../blocs/category/cat_state.dart';
import '../../blocs/product/product_bloc.dart';
import '../../blocs/product/product_event.dart';
import '../../blocs/product/product_state.dart';
import '../../../share/routes.dart';
import '../../../share/styles/colors.dart';

class TambahKatalog extends StatefulWidget {
  const TambahKatalog({super.key});

  @override
  State<TambahKatalog> createState() => _TambahKatalogState();
}

class _TambahKatalogState extends State<TambahKatalog> {
  File? image;

  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController stockController;
  late TextEditingController descriptionController;

  int categoryId = -1;

  AuthBloc authBloc = getIt<AuthBloc>();
  ProductBloc productBloc = getIt<ProductBloc>();
  CategoryBloc catBloc = getIt<CategoryBloc>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    priceController = TextEditingController();
    stockController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
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
            return BlocBuilder(
              bloc: catBloc,
              builder: (context, catState) {
                if (catState is CategoryLoaded) {
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
                      } else if (productState is ProductLoaded) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          homeAdmin,
                          (route) => false,
                          arguments: 0,
                        );
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              width: double.infinity,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: (image == null)
                                    ? Container(
                                        color: Colors.grey[300],
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
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
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      width: 400,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButtonFormField(
                                        hint: const Text('Pilih Kategori'),
                                        elevation: 4,
                                        borderRadius: BorderRadius.circular(15),
                                        items: [
                                          ...catState.categories.map(
                                            (e) => DropdownMenuItem<int>(
                                              value: e.id,
                                              child: Text(e.name
                                                  .removeCategoryPrevix()),
                                            ),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            categoryId = value!;
                                          });
                                        },
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
                                        "Harga",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      width: 400,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        cursorColor: kPrimaryColor,
                                        controller: priceController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "200000"),
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
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
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
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
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
                              
                                    if (image != null && categoryId > -1) {
                                      productBloc.add(
                                        ProductCreate(
                                          token: authState.user.token,
                                          name: nameController.text,
                                          description:
                                              descriptionController.text,
                                          categoryId: categoryId,
                                          stock:
                                              int.parse(stockController.text),
                                          price:
                                              int.parse(priceController.text),
                                          image: image!,
                                        ),
                                      );
                                    } else if (image == null) {
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
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
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
