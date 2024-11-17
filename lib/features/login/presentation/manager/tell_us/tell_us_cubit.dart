import 'package:flutter_bloc/flutter_bloc.dart';

part 'tell_us_state.dart';

class TellUsCubit extends Cubit<TellUsState> {
  TellUsCubit() : super(TellUsInitial());

  int activeIndex = 0;

  void activeIndexChange(int index) {
    if (activeIndex == index) return;
    activeIndex = index;

    emit(ChangeIndex());
  }

  DateTime date = DateTime(2000);
  String showdate = '';

  void pickDate(DateTime dateTime) {
    date = DateTime(dateTime.year, dateTime.month, dateTime.day);
    showdate = '${(DateTime.now().year - dateTime.year)} years';
    emit(PickDateSuccess());
  }
}
