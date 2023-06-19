import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme.freezed.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.toggle() = ToggleEvent;
}

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(false) bool isDarkModeEnabled,
  }) = _ThemeState;
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ToggleEvent>(_onToggle);
  }

  void _onToggle(ToggleEvent event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(isDarkModeEnabled: !state.isDarkModeEnabled));
  }
}
