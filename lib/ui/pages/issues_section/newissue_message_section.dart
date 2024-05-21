import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/component_factory.dart';
import 'package:municipium/utils/theme_helper.dart';

class NewIssueMessageSection extends StatelessWidget {
  const NewIssueMessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchedTags =
        context.read<IssueTagBloc>().state as FetchedIssueTagState;
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
                      style: TextStyle(fontSize: 17, letterSpacing: -0.4),
                    ),
                    SizedBox()
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                ComponentFactory.getBorderedTextField(
                  placeHolder: 'Nome e cognome',
                  value: state.name,
                  onChanged: (value) {
                    context.read<IssueCubit>().setNameSurname(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ComponentFactory.getBorderedTextField(
                  title: 'email',
                  value: state.email,
                  placeHolder: 'name@email.com',
                  onChanged: (value) {
                    context.read<IssueCubit>().setEmail(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ComponentFactory.getBorderedTextField(
                    placeHolder: 'Telefono',
                    value: state.phone,
                    onChanged: (value) {
                      context.read<IssueCubit>().setPhoneNUmber(value);
                    },
                    keyboardType: TextInputType.phone),
                const SizedBox(
                  height: 20,
                ),
                ComponentFactory.getBorderedTextField(
                    placeHolder: 'Indirizzo segnalazione',
                    value: state.address,
                    onChanged: (value) {
                      context.read<IssueCubit>().setAddress(value);
                    },
                    customIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.gps_fixed_outlined))),
                const SizedBox(
                  height: 20,
                ),
                ComponentFactory.getBorderedTextField(
                  placeHolder: 'Messaggio',
                  value: state.content,
                  height: 200,
                  onChanged: (value) {
                    context.read<IssueCubit>().setMessage(value);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
