import 'package:flutter/material.dart';

class InformationViewModel extends ChangeNotifier {
  String _url1 =
      "https://www.who.int/news-room/commentaries/detail/transmission-of-sars-cov-2-implications-for-infection-prevention-precautions";
  String get url1 => _url1;
  String _url2 =
      "https://www.google.com/search?q=symptoms+of+corona+virus&rlz=1C1CHBF_enNG900NG900&oq=symptoms+of+corona+virus&aqs=chrome..69i57j0l7.8771j0j7&sourceid=chrome&ie=UTF-8";
  String get url2 => _url2;
  String _url3 =
      "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/when-and-how-to-use-masks";
  String get url3 => _url3;
  String _url4 =
      "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public";
  String get url4 => _url4;
}
