import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:municipium/model/survey/survey.dart';
import 'package:municipium/model/survey/survey_response.dart';

class QuestionResultCard extends StatelessWidget {
  const QuestionResultCard({required this.result});
  final SurveyResult result;

  @override
  Widget build(BuildContext context) {
    // Raccoglie tutte le risposte e voti validi
    final List<MapEntry<String, int>> answers = [];

    if (result.answer1.isNotEmpty && result.answer1Votes > 0) {
      answers.add(MapEntry(result.answer1, result.answer1Votes));
    }
    if (result.answer2.isNotEmpty && result.answer2Votes > 0) {
      answers.add(MapEntry(result.answer2, result.answer2Votes));
    }
    if (result.answer3.isNotEmpty && result.answer3Votes > 0) {
      answers.add(MapEntry(result.answer3, result.answer3Votes));
    }
    if (result.answer4.isNotEmpty && result.answer4Votes > 0) {
      answers.add(MapEntry(result.answer4, result.answer4Votes));
    }
    if (result.answer5.isNotEmpty && result.answer5Votes > 0) {
      answers.add(MapEntry(result.answer5, result.answer5Votes));
    }

    // Calcola il totale dei voti per le percentuali
    final totalVotes = answers.fold<int>(
      0,
      (sum, answer) => sum + answer.value,
    );

    // Lista di colori per le sezioni della torta
    final List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(result.question,
                style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: PieChart(
                PieChartData(
                  sections: List.generate(
                    answers.length,
                    (index) {
                      final percentage =
                          (answers[index].value / totalVotes) * 100;
                      return PieChartSectionData(
                        color: colors[index % colors.length],
                        value: answers[index].value.toDouble(),
                        title: '${percentage.toStringAsFixed(1)}%',
                        radius: 140,
                        titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                  sectionsSpace: 2,
                  centerSpaceRadius: 0,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                answers.length,
                (index) => Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: colors[index % colors.length],
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${answers[index].key} (${answers[index].value})',
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
          
          ],
        ),
      ),
    );
  }
}
