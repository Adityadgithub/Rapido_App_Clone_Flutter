import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Personal Wallet",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Image(
                                    image: AssetImage("assets/paytm.png")),
                              ),
                              SizedBox(width: 30),
                              Text("Paytm"),
                            ],
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {},
                            child: Text(
                              "Link",
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage("assets/mobikwik.png"),
                                ),
                                minRadius: 25,
                                maxRadius: 25,
                              ),
                              SizedBox(width: 30),
                              Text("Mobikwik"),
                            ],
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {},
                            child: Text(
                              "Link",
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child:
                                    Image(image: AssetImage("assets/gpay.png")),
                              ),
                              SizedBox(width: 30),
                              Text("Google Pay"),
                            ],
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {},
                            child: Text(
                              "Link",
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child:
                                    Image(image: AssetImage("assets/test.png")),
                              ),
                              SizedBox(width: 30),
                              Text("Razor Pay"),
                            ],
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {},
                            child: Text(
                              "Link",
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.money_outlined, size: 30),
                              ),
                              SizedBox(width: 30),
                              Text("Cash"),
                            ],
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {},
                            child: Text(
                              "Pay",
                            ))
                      ],
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 150,
                child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.black),
                    onPressed: () {},
                    child: Text(
                      "PAYMENT",
                      style: TextStyle(color: Colors.yellow),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
