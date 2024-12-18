import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/lissi/prestenation_lissi_template.dart';
import 'package:municipium/repositories/lissi_repository.dart';

part 'lissi_presentation_template_event.dart';
part 'lissi_presentation_template_state.dart';

class LissiPresentationTemplateBloc 
    extends Bloc<PresentationTemplatesEvent, PresentationTemplatesState> {
  final LissiRepository presentationTemplatesRepository;

  LissiPresentationTemplateBloc({required this.presentationTemplatesRepository})
      : super(const FetchingPresentationTemplatesState()) {
    on<FetchPresentationTemplatesEvent>(_fetchPresentationTemplates);
  }

  void fetchPresentationTemplates() =>
      add(const FetchPresentationTemplatesEvent());

  FutureOr<void> _fetchPresentationTemplates(
      FetchPresentationTemplatesEvent event,
      Emitter<PresentationTemplatesState> emit) async {
    emit(const FetchingPresentationTemplatesState());
    try {
      final presentationTemplates = await presentationTemplatesRepository
          .getPresentationTemplates();
      
      if (presentationTemplates.isNotEmpty) {
        emit(FetchedPresentationTemplatesState(presentationTemplates));
      } else {
        emit(const NoPresentationTemplatesState());
      }
    } catch (error) {
      emit(const ErrorPresentationTemplatesState());
    }
  }
}