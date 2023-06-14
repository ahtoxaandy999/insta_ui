import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insta_ui/src/repository/content/content_repo.dart';

part 'content.freezed.dart';

@freezed
class ContentEvent with _$ContentEvent {
  const factory ContentEvent.started() = StartedEvent;
}

@freezed
class ContentState with _$ContentState {
  const factory ContentState({
    @Default(false) bool isLoading,
  }) = _ContentState;
}

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRepo _repo;

  ContentBloc(this._repo) : super(const ContentState()) {
    on<StartedEvent>(_onStarted);
  }

  void _onStarted(StartedEvent event, Emitter<ContentState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }
}
