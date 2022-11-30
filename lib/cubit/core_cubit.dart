import 'package:bloc/bloc.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(CoreState());

  Future<void> switchTheme() async {
    emit(state.copyWith(darkMode: !state.darkMode));
  }
}
