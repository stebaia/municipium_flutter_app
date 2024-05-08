import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/theme_helper.dart';

class NewIssueMessageSection extends StatelessWidget {
  const NewIssueMessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueCubit, ProgressIssue>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Tutti i campi sono obbligatori',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox()
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                getBorderedTextField(
                  placeHolder: 'Nome e cognome',
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                getBorderedTextField(
                  title: 'email',
                  placeHolder: 'name@email.com',
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                getBorderedTextField(
                  placeHolder: 'Telefono',
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                getBorderedTextField(
                    placeHolder: 'Indirizzo segnalazione',
                    onChanged: (value) {},
                    customIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.gps_fixed_outlined))),
                const SizedBox(
                  height: 20,
                ),
                getBorderedTextField(
                  placeHolder: 'Messaggio',
                  height: 200,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getBorderedTextField(
      {String? title,
      IconButton? customIcon,
      String? placeHolder,
      Function(String)? onChanged,
      double? height}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              (title ?? placeHolder ?? '').toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            ),
            const SizedBox()
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: height,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(color: ThemeHelper.lightGrey),
              borderRadius: BorderRadius.circular(12)),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
                suffixIcon: customIcon,
                hintText: placeHolder,
                border: InputBorder.none,
                hintStyle: const TextStyle(color: ThemeHelper.lightGrey)),
          ),
        )
      ],
    );
  }
}
