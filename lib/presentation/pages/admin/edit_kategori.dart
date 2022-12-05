import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/domain/usecases/string_extension.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/blocs/category/cat_bloc.dart';
import 'package:waroengku/presentation/blocs/category/cat_event.dart';
import 'package:waroengku/presentation/blocs/category/cat_state.dart';
import 'package:waroengku/share/routes.dart';

import '../../../injection_container.dart';
import '../../../share/styles/colors.dart';

class EditKategoriPage extends StatefulWidget {
  Category category;
  EditKategoriPage({super.key, required this.category});

  @override
  State<EditKategoriPage> createState() => _EditKategoriPageState();
}

class _EditKategoriPageState extends State<EditKategoriPage> {
  late TextEditingController nameController;
  late AuthBloc authBloc;
  late CategoryBloc catBloc;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: widget.category.name.removeCategoryPrevix(),
    );
    authBloc = getIt<AuthBloc>();
    catBloc = getIt<CategoryBloc>();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("masuk sini lagi");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBBCFE4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit Kategori',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder(
        bloc: authBloc,
        builder: (context, authState) {
          if (authState is Authenticated) {
            return BlocListener(
              bloc: catBloc,
              listener: (context, catState) {
                if (catState is CategoryLoaded) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    homeAdmin,
                    (route) => false,
                    arguments: 1,
                  );
                } else if (catState is CategoryOnLoad) {
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
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipPath(
                                clipper: MyClipper(),
                                child: Container(
                                  color: const Color(0xffBBCFE4),
                                  height: 350,
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/images/jahe.png"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "Nama Kategori",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
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
                            child: TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(), hintText: ""),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                        onTap: () {
                          print(nameController.text);
                          catBloc.add(
                            CategoryEdit(
                              token: authState.user.token,
                              id: widget.category.id,
                              newName: nameController.text,
                            ),
                          );
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
                              "Simpan Perubahan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
