import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryCard extends StatelessWidget {
  final String country;
  final int totalDeaths;
  final int totalRecovery;
  final int totalCases;
  final String date;
  final int newRecovery;
  final int newDeaths;
  final int newCases;

  CountryCard({
    this.newCases,
    this.newDeaths,
    this.newRecovery,
    this.date,
    this.country,
    this.totalCases,
    this.totalDeaths,
    this.totalRecovery,
  });
  @override
  Widget build(BuildContext context) {
    double percentage = (newCases / totalCases) * 100;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.all(10),
        child: Container(
          height: 220,
          decoration: BoxDecoration(
              // color: Colors.pink,
              ),
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Text(
                      country,
                      style: GoogleFonts.grenze(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("${percentage.roundToDouble()}%",
                        style: GoogleFonts.philosopher(color: Colors.red)),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Text("Death Cases",
                              style: GoogleFonts.philosopher(
                                fontSize: 20,
                              )),
                          Spacer(),
                          Text(
                            // ignore: unnecessary_brace_in_string_interps
                            "${totalDeaths}",
                            style: GoogleFonts.philosopher(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Text("Recovered Cases",
                              style: GoogleFonts.philosopher(
                                fontSize: 20,
                              )),
                          Spacer(),
                          Text(
                            // ignore: unnecessary_brace_in_string_interps
                            "${totalRecovery}",
                            style: GoogleFonts.philosopher(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Text("Total Cases",
                              style: GoogleFonts.philosopher(
                                fontSize: 20,
                              )),
                          Spacer(),
                          Text(
                            // ignore: unnecessary_brace_in_string_interps
                            "${totalCases}",
                            style: GoogleFonts.philosopher(
                              fontSize: 20,
                              color: Colors.amber,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
