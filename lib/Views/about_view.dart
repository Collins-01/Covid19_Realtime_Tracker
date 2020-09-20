import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "About Covid19",
              style: GoogleFonts.grenze(
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/covid19_2.jpg")),
                    color: Colors.black.withOpacity(0.7)),
                child: Container(
                  height: 280,
                  margin: EdgeInsets.all(15),
                  child: Wrap(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text("Corona Virus Disease\n (Covid19) Outbreak",
                            style: GoogleFonts.philosopher(
                                color: Colors.red, fontSize: 20)),
                      ),
                      SizedBox(height: 50),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Most People Infected With The COVID-19 Virus Will Experience Mild To Moderate Respirstory Illness And Requiring Special Treatment. Older People , And Those With Underlying Medical Problems.",
                          style: GoogleFonts.philosopher(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                  child: Text("What Is \n CoronaVirus?",
                      style: GoogleFonts.grenze(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  padding: const EdgeInsets.symmetric(horizontal: 15)),
              Container(
                  margin: EdgeInsets.all(12),
                  child: Wrap(
                    children: <Widget>[
                      Text(
                          "CoronaVirus (acording to WHO) are a family of viruses that cause illness ranging from the common cold to more severe diseases such as severe acute respiratory syndrome(SARS) and the Middle East respiratory syndrome(MERS). Thier original mode of transmission were animal to human Covid-19 is an acronym  \n 'CO' stands for CoronaVirus  \n 'VI' stands for Virus  \n  'D' stands for Disease  \n '19' stands for the Year it was found. \n It can lead to pnuemnia,multiple organ faliure and even death in severe cases. ",
                          style: GoogleFonts.philosopher()),
                    ],
                  )),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "* High Fever",
                      style: GoogleFonts.philosopher(
                          fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Text("* Dry Cough",
                        style: GoogleFonts.philosopher(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    Text("* Over Tiredness",
                        style: GoogleFonts.philosopher(
                            fontSize: 19, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  image: DecorationImage(
                    image: AssetImage("assets/covid19.jpg"),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Emergency Support",
                      style: GoogleFonts.philosopher(
                        color: Colors.red,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email Add",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 18),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.home),
                          hintText: "Home Address ",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 18),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_in_talk),
                          hintText: "Phone No ",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      color: Colors.pink,
                      onPressed: () {},
                      child: Text("Submit",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
        )
      ],
    )));
  }
}
