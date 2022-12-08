import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
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
          "Checkout",
        ),
      ),
      body: ListView(
          padding: const EdgeInsets.all(
            10.0,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("Your Addres"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Center(
                child: SizedBox(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: const Color.fromARGB(255, 235, 231, 231),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Alamat',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:const <Widget>[
                              Padding(
                                padding:
                                     EdgeInsets.only(top: 5, left: 10),
                                child: Text(
                                  'Jalan Melati, Jakarta',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            Divider(
                                color: Colors.black,
                                height: 25,
                                thickness: 1,
                                indent: 5,
                                endIndent: 5,
                              )  ,
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Center(
                child: SizedBox(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: const Color.fromARGB(255, 235, 231, 231),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Nama Gedung/ Patokan',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 5,
                                  left: 10,
                                ),
                                child: Text(
                                  'Gg. Jambu, No, 31, Pagar Putih',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                height: 25,
                                thickness: 1,
                                indent: 5,
                                endIndent: 5,
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "Your Product",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: SizedBox(
                          width: 500,
                          height: 200,
                          child: Card(
                            color: const Color.fromARGB(255, 235, 231, 231),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const <Widget>[],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Beras Pandan Wangi",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Rp. 27.000",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontStyle: FontStyle.italic,
                                              wordSpacing: 5,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 10),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.red),
                                          child: const Text(
                                            "-",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 10),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.red),
                                          child: const Text(
                                            "1",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 10),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.red),
                                          child: const Text(
                                            "+",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "Metode Pembayaran",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: SizedBox(
                          width: 500,
                          height: 75,
                          child: Card(
                            color: const Color.fromARGB(255, 235, 231, 231),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const <Widget>[
                                        Icon(
                                          Icons.attach_money_outlined,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          'COD (Bayar di Tempat)',
                                          style: TextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "Rincian Pembayaran",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: SizedBox(
                            width: 500,
                            height: 200,
                            child: Card(
                              color: const Color.fromARGB(255, 235, 231, 231),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const <Widget>[
                                          Text(
                                            "Subtotal untuk produk",
                                          ),
                                          Text("Rp. 45.000"),
                                        ],
                                      ),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const <Widget>[
                                                Text("Biaya Layanan"),
                                                Text("Rp. 1.000"),
                                              ],
                                            ),
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const <Widget>[
                                                      Text("Ongkos Kirim"),
                                                      Text("Rp. 5.000"),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  color: Colors.black,
                                                  height: 25,
                                                  thickness: 1,
                                                  indent: 5,
                                                  endIndent: 5,
                                                ),
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const <Widget>[
                                                            Text(
                                                                "Total Pembayaran"),
                                                            Text("Rp. 51.000"),
                                                          ],
                                                        ),
                                                      ),
                                                    ]),
                                              ]),
                                        ]),
                                  ]),
                            )),
                      ),
                    )
                  ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: const Size(430, 60),
                            side: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Buat Pesanan'),
                        ),
                      ]),
                ),
              ],
            ),
          ]),
    );
  }
}
