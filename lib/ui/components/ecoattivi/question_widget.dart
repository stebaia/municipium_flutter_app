import 'package:flutter/material.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_question.dart';

class QuestionWidget extends StatelessWidget {
  final EcoattiviQuestion? question;
  final Function(int id)? onPressed;
  final Map<int, Color> buttonColors;
  final Widget? child;

  const QuestionWidget({
    Key? key,
    this.question,
    this.onPressed,
    required this.buttonColors,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      // Se il contenuto personalizzato è fornito, lo utilizza
      return child!;
    }
    if (question == null) {
      return const SizedBox(); // Evita errori se `question` è nullo e `child` non è fornito
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question!.testo ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(question!.risposte!.length, (index) {
            final answer = question!.risposte![index];
            final buttonColor = buttonColors[answer.rispostaId] ?? Colors.white;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor:
                      buttonColor == Colors.white ? Colors.black : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.black),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed!(answer.rispostaId!);
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${String.fromCharCode(65 + index)}. ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        answer.testo ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
