import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class CalendarLogic {
  static Future<Map<String, String>> getQuote() async {
    try {
      var response = await http
          .get(Uri.parse('https://quote-garden.onrender.com/api/v3/quotes'));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var quotes = jsonResponse['data'];

        if (quotes.isNotEmpty) {
          var randomIndex = Random().nextInt(quotes.length);
          var randomQuote = quotes[randomIndex];

          var quote = randomQuote['quoteText'].toString().trim();
          var owner = randomQuote['quoteAuthor'].toString().trim();

          return {
            'quote': quote,
            'owner': owner,
          };
        }
      }
    } catch (e) {}

    return {
      'quote': 'The phoenix must to emerge',
      'owner': 'Janet Fitch',
    };
  }
}
