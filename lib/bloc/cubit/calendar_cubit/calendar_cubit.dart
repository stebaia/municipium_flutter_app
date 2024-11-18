import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<DateTime> {
  CalendarCubit() : super(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  void setDate(DateTime date) => emit(date);
}
