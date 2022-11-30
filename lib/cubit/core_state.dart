// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'core_cubit.dart';

class CoreState {
  final bool darkMode;
  CoreState({
    this.darkMode = false,
  });

  CoreState copyWith({
    bool? darkMode,
  }) {
    return CoreState(
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
