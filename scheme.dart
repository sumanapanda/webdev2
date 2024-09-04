import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  // Import the url_launcher package

void main() => runApp(FarmerApp());

class FarmerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farmer Loan and Schemes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SchemePage(),
    );
  }
}

class SchemePage extends StatelessWidget {
  final List<Scheme> schemes = [
    Scheme(
      title: 'Pradhan Mantri Krishi Sinchai Yojana (PMKSY)',
      description:
          'A national mission to improve farm productivity and ensure better utilization of the resources in the country.',
      link: 'https://pmksy.gov.in',
    ),
    Scheme(
      title: 'Soil Health Card Scheme',
      description:
          'The Soil Health Card Scheme provides farmers with information on the nutrient status of their soil and how to improve it.',
      link: 'https://soilhealth.dac.gov.in',
    ),
    Scheme(
      title: 'Rashtriya Krishi Vikas Yojana (RKVY)',
      description:
          'A scheme to incentivize states to increase public investment in agriculture and allied sectors.',
      link: 'https://rkvy.nic.in',
    ),
    Scheme(
      title: 'National Mission for Sustainable Agriculture (NMSA)',
      description:
          'A mission aimed at promoting sustainable agriculture through various strategies, including soil conservation, water use efficiency, and nutrient management.',
      link: 'https://nmsa.dac.gov.in',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Government Schemes'),
      ),
      body: ListView.builder(
        itemCount: schemes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    schemes[index].title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    schemes[index].description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _launchURL(schemes[index].link);
                    },
                    child: Text('Learn More', style: TextStyle(color: Colors.white),),
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

class Scheme {
  final String title;
  final String description;
  final String link;

  Scheme({
    required this.title,
    required this.description,
    required this.link,
  });
}