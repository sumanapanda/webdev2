import 'package:flutter/material.dart';
import 'login_screen.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your Language'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Namaste!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('Select your language'),
              SizedBox(height: 20),
              LanguageOption(
                language: 'ಕನ್ನಡ',
                description: 'ನಿಮ್ಮ ಭಾಷೆಯಲ್ಲಿ ಕೃಷಿ',
                value: 'kn',
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
              LanguageOption(
                language: 'ଓଡ଼ିଆ',
                description: 'ଆପଣଙ୍କ ଭାଷାରେ କୃଷିକାର୍ଯ୍ୟ',
                value: 'or',
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
              LanguageOption(
                language: 'বাংলা',
                description: 'চাষাবাদের কথা আপনার ভাষায়',
                value: 'bn',
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
              LanguageOption(
                language: 'தமிழ்',
                description: 'உங்கள் மொழியில் வேளாண்மை',
                value: 'ta',
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
              LanguageOption(
                language: 'मराठी',
                description: 'स्वत:च्या भाषेत शेती',
                value: 'mr',
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
              LanguageOption(
                language: 'ਪੰਜਾਬੀ',
                description: 'ਤੁਹਾਡੀ ਭਾਸ਼ਾ ਵਿੱਚ ਖੇਤੀਬਾੜੀ',
                value: 'pa',
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
              LanguageOption(
                language: 'हिन्दी',
                description: 'खेती आपकी भाषा में',
                value: 'hi',
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
              LanguageOption(
                language: 'English',
                description: 'Farming in your language',
                value: 'en',
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (selectedLanguage != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please select a language')),
              );
            }
          },
          child: Text('Continue'),
        ),
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String language;
  final String description;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  LanguageOption({
    required this.language,
    required this.description,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: RadioListTile<String>(
        title: Text(language, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: Colors.green,
      ),
    );
  }
}
