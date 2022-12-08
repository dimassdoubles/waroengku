// ignore_for_file: use_key_in_widget_constructors, annotate_overrides

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:waroengku/domain/entity/detail_transaction.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/injection_container.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/blocs/review/review_bloc.dart';
import 'package:waroengku/presentation/blocs/review/review_event.dart';
import 'package:waroengku/presentation/blocs/review/review_state.dart';
import 'package:waroengku/presentation/cubits/raw_review_cubit.dart';
import 'package:waroengku/share/routes.dart';
import 'package:waroengku/share/styles/colors.dart';

import '../../../domain/entity/transaction.dart';
import '../../../domain/usecases/pick_image.dart';

class ReviewsPage extends StatefulWidget {
  final Transaction transaction;
  const ReviewsPage({
    Key? key,
    required this.transaction,
  });

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  late RawReviewCubit rawRCubit;
  @override
  void initState() {
    super.initState();
    rawRCubit = RawReviewCubit(transaction: widget.transaction);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Review Produk',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 16,
          ),
          ...widget.transaction.detailTransactions.asMap().entries.map((e) {
            int index = e.key;
            DetailTransaction detailTransaction = e.value;
            return InputReview(
              rawRCubit: rawRCubit,
              index: index,
              product: detailTransaction.product,
            );
          }),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder(
            bloc: getIt<AuthBloc>(),
            builder: (context, authState) {
              if (authState is Authenticated) {
                return BlocListener(
                  bloc: getIt<ReviewBloc>(),
                  listener: (context, revState) {
                    if (revState is ReviewOnload) {
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
                    } else if (revState is ReviewFinish) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        dashboardPage,
                        (route) => false,
                      );
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      bool allFilled = true;
                      for (int i = 0; i < rawRCubit.state.length; i++) {
                        if (rawRCubit.state[i].review == "" ||
                            rawRCubit.state[i].image == null) {
                          allFilled = false;
                          break;
                        }
                      }
                      if (allFilled) {
                        getIt<ReviewBloc>().add(
                          ReviewCreate(
                            token: authState.user.token,
                            rawReeviews: rawRCubit.state,
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Bagikan Review",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Bagikan Review",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InputReview extends StatefulWidget {
  final RawReviewCubit rawRCubit;
  final int index;
  final Product product;
  const InputReview({
    Key? key,
    required this.rawRCubit,
    required this.index,
    required this.product,
  }) : super(key: key);

  @override
  State<InputReview> createState() => _InputReviewState();
}

class _InputReviewState extends State<InputReview> {
  File? image;
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
                      widget.rawRCubit.setImage(
                        index: widget.index,
                        value: imagePicked,
                      );
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              chooseImageSource();
            },
            child: SizedBox(
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
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 24,
              itemBuilder: (context, index) => const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) {
                widget.rawRCubit
                    .setStar(index: widget.index, value: rating.round());
              }),
          TextField(
            onChanged: (value) {
              widget.rawRCubit.setReview(index: widget.index, value: value);
            },
          ),
        ],
      ),
    );
  }
}
