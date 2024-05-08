import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/model/issue/progress_issue.dart';

class NewIssueRecapSection extends StatelessWidget {
  const NewIssueRecapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueCubit, ProgressIssue>(
      builder: (context, state) {
        return Container(
          height: 200,
          decoration: BoxDecoration(color: Colors.red),
        );
      },
    );
  }
}
