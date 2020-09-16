import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String name;
  final dynamic content;
  const NewsCard(
      {@required this.content,
      @required this.description,
      @required this.publishedAt,
      @required this.title,
      @required this.url,
      @required this.name,
      @required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final Function hp = Screen(context).hp;
    final Function wp = Screen(context).wp;

    var orientation = MediaQuery.of(context).orientation;

    return InkWell(
        onTap: () async {
          if (await canLaunch(url))
            await launch(
              url,
              forceSafariVC: true,
              forceWebView: true,
            );
        },
        child: Container(
          width: wp(100),
          height: orientation == Orientation.portrait ? hp(21) : hp(40),
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.09),
                  blurRadius: 20,
                  spreadRadius: 3.5,
                  offset: Offset(0, 13)),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xffD6D6D6).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        name == null ? "News" : name,
                        style: GoogleFonts.cabin(
                          textStyle:
                              TextStyle(color: Colors.grey[400], fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                    color: Color(0xff243358),
                                    fontWeight: FontWeight.bold),
                                fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            publishedAt ?? "",
                            style: GoogleFonts.cabin(
                              textStyle: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Flexible(
                flex: 4,
                child: Container(
                  height: screenHeight * 0.24,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      image: urlToImage != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(urlToImage))
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/empty.jpg"))),
                ),
              )
            ],
          ),
        ));
  }
}
