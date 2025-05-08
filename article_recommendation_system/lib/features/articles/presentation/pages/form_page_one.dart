import 'package:article_recommendation_system/core/theme/widgets_themes.dart';
import 'package:article_recommendation_system/features/articles/data/tags/tags_mapping_to_form.dart';
import 'package:flutter/material.dart';
import 'form_page_two.dart';

class FormPageOne extends StatefulWidget {
  const FormPageOne({super.key});

  @override
  _FormPageOneState createState() => _FormPageOneState();
}

class _FormPageOneState extends State<FormPageOne> {
  String? selectedMusic;
  String? selectedFilm;
  String? selectedSpending;

  final List<String> musicOptions = [
    formTags['tag_slow_fast'] ?? 'Slow songs or fast songs',
    formTags['tag_dance'] ?? 'Dance',
    formTags['tag_folk'] ?? 'Folk',
    formTags['tag_country'] ?? 'Country',
    formTags['tag_classical'] ?? 'Classical music',
    formTags['tag_musical'] ?? 'Musical',
    formTags['tag_pop'] ?? 'Pop',
    formTags['tag_rock'] ?? 'Rock',
    formTags['tag_metal'] ?? 'Metal or Hardrock',
    formTags['tag_punk'] ?? 'Punk',
    formTags['tag_hiphop'] ?? 'Hiphop',
    formTags['tag_rap'] ?? 'Rap',
    formTags['tag_ska'] ?? 'Ska',
    formTags['tag_reggae'] ?? 'Reggae',
    formTags['tag_swing'] ?? 'Swing',
    formTags['tag_jazz'] ?? 'Jazz',
    formTags['tag_rocknroll'] ?? 'Rock n roll',
    formTags['tag_alternative'] ?? 'Alternative',
    formTags['tag_latino'] ?? 'Latino',
    formTags['tag_techno'] ?? 'Techno',
    formTags['tag_trance'] ?? 'Trance',
  ];
  final List<String> filmOptions = [
    formTags['tag_opera'] ?? 'Opera',
    formTags['tag_movies'] ?? 'Movies',
    formTags['tag_horror'] ?? 'Horror',
    formTags['tag_thriller'] ?? 'Thriller',
    formTags['tag_comedy'] ?? 'Comedy',
    formTags['tag_romantic'] ?? 'Romantic',
    formTags['tag_scifi'] ?? 'Sci-fi',
    formTags['tag_war'] ?? 'War',
    formTags['tag_fantasy'] ?? 'Fantasy/Fairy tales',
    formTags['tag_animated'] ?? 'Animated',
    formTags['tag_documentary'] ?? 'Documentary',
    formTags['tag_western'] ?? 'Western',
    formTags['tag_action'] ?? 'Action',
  ];

  final List<String> spendingOptions = [
    formTags['tag_brand_clothes'] ?? 'Branded clothing',
    formTags['tag_entertainment'] ?? 'Entertainment spending',
    formTags['tag_looks_spending'] ?? 'Spending on looks',
    formTags['tag_gadgets_spending'] ?? 'Spending on gadgets',
    formTags['tag_health_spending'] ?? 'Spending on healthy eating',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Additional informations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
              'To better understand your needs and support your growth, please complete the additional fields for article recommendation:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            buildDropdownQuestion(
              question: 'What type of music do you enjoy the most?',
              value: selectedMusic,
              items: musicOptions,
              onChanged: (value) {
                setState(() {
                  selectedMusic = value;
                });
              },
            ),
            const SizedBox(height: 20),
            buildDropdownQuestion(
              question: 'What type of films do you enjoy the most?',
              value: selectedFilm,
              items: filmOptions,
              onChanged: (value) {
                setState(() {
                  selectedFilm = value;
                });
              },
            ),
            const SizedBox(height: 20),
            buildDropdownQuestion(
              question: 'What do you usually spend the most your money on?',
              value: selectedSpending,
              items: spendingOptions,
              onChanged: (value) {
                setState(() {
                  selectedSpending = value;
                });
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                print('Music: $selectedMusic');
                print('Film: $selectedFilm');
                print('Spending: $selectedSpending');
              },
              style: NextButton(context),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownQuestion({
    required String question,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        DropdownButtonFormField<String>(
          value: value,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
