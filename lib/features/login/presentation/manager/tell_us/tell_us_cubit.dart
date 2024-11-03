import 'package:flutter_bloc/flutter_bloc.dart';

part 'tell_us_state.dart';

class TellUsCubit extends Cubit<TellUsState> {
  TellUsCubit() : super(TellUsInitial());

  int activeIndex = 0;
  int year = 0;

  void activeIndexChange(int index) {
    if (activeIndex == index) return;
    activeIndex = index;

    emit(ChangeIndex());
  }

  void pickYear(int index) {
    year = DateTime.now().year - index;
    emit(PickYearSuccess());
  }
}
