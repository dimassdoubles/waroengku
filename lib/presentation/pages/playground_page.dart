import 'dart:io';

import 'package:flutter/material.dart';
import 'package:waroengku/data/data_sources/product/remote_data_source.dart';
import 'package:waroengku/data/data_sources/review/remote_data_source.dart';
import 'package:waroengku/domain/usecases/pick_image.dart';

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({super.key});

  @override
  State<PlaygroundPage> createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (image != null)
                ? AspectRatio(
                    aspectRatio: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.file(
                        image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final imagePicked = await pickImage(context);
                  if (imagePicked != null) {
                    setState(() {
                      image = imagePicked;
                    });
                  }
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text("Pick Image"),
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    image = null;
                  });
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text("Remove Image"),
                  ),
                ),
              ),
            ),
            (image != null)
                ? ElevatedButton(
                    onPressed: () async {
                      await createReview(image!);
                      print("selesai");
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text('Create Review'),
                      ),
                    ),
                  )
                : const SizedBox(),
            (image != null)
                ? Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        print("Mencoba buat barang");
                        await createBarang(image!);
                        print("Selesai buat barang");
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text("Create Barang"),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            (image != null)
                ? ElevatedButton(
                    onPressed: () async {
                      print("Mencoba update barang");
                      await updateBarang(image!);
                      print("Selesai update barang");
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text('Update Barang'),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

updateBarang(File image) async {
  ProductRemoteDataSource remoteDataSource = ProductRemoteDataSourceImpl();
  await remoteDataSource.updateProduct(
    "1129|qulDXTrYqKialTizB7wz7xC2FhM2XnD3rdXk9ZlD",
    62,
    "kelompok 1 test product update",
    1,
    image,
    1001,
    "kelompok 1 coba buat product update",
    10000,
  );
}

createBarang(File image) async {
  ProductRemoteDataSource remoteDataSource = ProductRemoteDataSourceImpl();
  await remoteDataSource.createProduct(
    "1129|qulDXTrYqKialTizB7wz7xC2FhM2XnD3rdXk9ZlD",
    "kelompok 1 test product",
    1,
    image,
    1001,
    "kelompok 1 coba buat product",
    10000,
  );
}

createReview(File image) async {
  ReviewRemoteDataSource remoteDataSource = ReviewRemoteDataSourceImpl();
  await remoteDataSource.createReview(
    "938|Dt6ZztWCumzBH6GsatiNxD8V9AurUS6uzJmdiiRa",
    3,
    4,
    "Kelompok 1 coba review",
    image,
  );
}
