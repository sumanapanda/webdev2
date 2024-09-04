import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(LoanApp());

class LoanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmer Loan and Schemes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoanPage(),
    );
  }
}

class LoanPage extends StatelessWidget {
  final List<LoanScheme> loanSchemes = [
    LoanScheme(
      title: 'Kisan Credit Card (KCC)',
      description:
          'The Kisan Credit Card Scheme provides short-term credit to farmers for purchasing seeds, fertilizers, pesticides, and other essentials.',
      link: 'https://www.kcc.gov.in',
    ),
    LoanScheme(
      title: 'PM Kisan Samman Nidhi',
      description:
          'PM Kisan Yojana offers financial assistance to small and marginal farmers in the form of direct cash transfer.',
      link: 'https://www.pmkisan.gov.in',
    ),
    LoanScheme(
      title: 'Pradhan Mantri Fasal Bima Yojana (PMFBY)',
      description:
          'Crop insurance scheme for farmers, providing financial support in case of crop failure due to natural calamities.',
      link: 'https://www.pmfby.gov.in',
    ),
    LoanScheme(
      title: 'NABARD Loan for Farmers',
      description:
          'NABARD provides various agricultural loans to promote rural development and support farmers in India.',
      link: 'https://www.nabard.org',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Government Loans & Schemes'),
      ),
      body: ListView.builder(
        itemCount: loanSchemes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loanSchemes[index].title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    loanSchemes[index].description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _launchURL(loanSchemes[index].link);
                    },
                    child: Text('Learn More', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(67, 160, 71, 1),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class LoanScheme {
  final String title;
  final String description;
  final String link;

  LoanScheme({
    required this.title,
    required this.description,
    required this.link,
  });
}
