import 'package:article_recommendation_system/core/theme/app_pallete.dart';
import 'package:article_recommendation_system/core/theme/widgets_themes.dart';
import 'package:flutter/material.dart';

class FormPageTwo extends StatefulWidget {
  const FormPageTwo({super.key});

  @override
  State<FormPageTwo> createState() => _FormPageTwoState();
}

class _FormPageTwoState extends State<FormPageTwo> {
  final List<String> answers = [
    'left handed',
    'an only child',
    'hypochondric',
    'introvertic (lonely)',
    'assertive',
    'a cheater',
    'heatlthy',
    'part of a charity',
    'an achiever',
    'a workaholic',
    'thinking ahead',
    'keeping promises',
    'happy in live',
    'getting up early',
    'unpopular',
    'good in decision making',
  ];

  Set<String> selectedAnswers = {};

  void toggleSelection(String answer) {
    setState(() {
      if (selectedAnswers.contains(answer)) {
        selectedAnswers.remove(answer);
      } else {
        selectedAnswers.add(answer);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Additional informations')),
      backgroundColor: AppPallete.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center items vertically
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Text(
              'Are you.... ?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 70),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: answers.map((answer) {
                final isSelected = selectedAnswers.contains(answer);
                return ElevatedButton(
                  onPressed: () => toggleSelection(answer),
                  style: answerButtonStyle(isSelected: isSelected),
                  child: Text(answer),
                );
              }).toList(),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Selected answers: $selectedAnswers');
                  // Navigate to next form page or process data
                },
                style: NextButton(context),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
