import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);
  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow),
      body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Search issue",
                        hintStyle: TextStyle(height: 0.8),
                        prefixIcon: Icon(Icons.search))),
              ),
              SizedBox(height: 30),
              Container(
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.help),
                          Text("Having an issue?"),
                          TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () {},
                              child: Text("Get Help"))
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 0.3),
              Container(
                height: 40,
                child: Material(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "View all tickets",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 135, 246)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Text(
                  "FAQs",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.shortestSide,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundImage:
                                        AssetImage('assets/saftey.jpg'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '''Safety &
Security''',
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            27,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: TextButton(
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image(
                                          image:
                                              AssetImage('assets/ride2.png')),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '''Ride &
Billing''',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .aspectRatio *
                                              27,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 23,
                                        backgroundImage:
                                            AssetImage('assets/services.png'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '''Services
    ''',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .aspectRatio *
                                                27,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    child: Icon(Icons.person),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '''Account
 & App''',
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            27,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: TextButton(
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 23,
                                      backgroundImage:
                                          AssetImage('assets/referrals.jpg'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '''Referrals
   ''',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .aspectRatio *
                                              27,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                child: TextButton(
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 23,
                                    child: Icon(
                                        Icons.account_balance_wallet_rounded),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '''Payment
& Wallets''',
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            27,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    child: Icon(Icons.card_membership),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '''Power
 Pass''',
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            27,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
