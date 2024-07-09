import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/base_url_cubit/base_url_cubit.dart';
import 'package:municipium/utils/position_utils.dart';

typedef BaseUrlSelectorWidgetBuilder = Widget Function(BuildContext, BaseUrlType);

class BaseUrlSelector extends StatelessWidget {
  final BaseUrlSelectorWidgetBuilder builder;

  const BaseUrlSelector({super.key, required this.builder});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseUrlCubit, BaseUrlState>(builder:(context, state) => builder(context, state.prod ? BaseUrlType.prod : BaseUrlType.staging),);
  }
}