import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:teacher_mate_landing/utils/util/app_locales.dart';

sealed class LandingEvent {
  const LandingEvent();

  const factory LandingEvent.init() = LandingInitEvent;
  const factory LandingEvent.locale() = LandingLocaleEvent;
}

class LandingInitEvent extends LandingEvent {
  const LandingInitEvent();
}

class LandingLocaleEvent extends LandingEvent {
  const LandingLocaleEvent();
}

class LandingState {
  final String locale;
  const LandingState({required this.locale});
  factory LandingState.initial() => LandingState(locale: 'ru');

  LandingState copyWith({String? locale}) {
    return LandingState(locale: locale ?? this.locale);
  }
}

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingState.initial()) {
    on<LandingInitEvent>(_init);
    on<LandingLocaleEvent>(_locale);
  }

  Future<void> _init(
    LandingInitEvent event,
    Emitter<LandingState> emitter,
  ) async {
    final locale = const AppLocales().getDefaultLocale();
    emitter(state.copyWith(locale: locale));
  }

  Future<void> _locale(
    LandingLocaleEvent event,
    Emitter<LandingState> emitter,
  ) async {
    emitter(state.copyWith(locale: state.locale == 'en' ? 'ru' : 'en'));
  }
}
