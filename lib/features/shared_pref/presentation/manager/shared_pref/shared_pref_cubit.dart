import 'package:e_clot_shop/features/shared_pref/data/repo/shared_pref_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shared_pref_state.dart';

class SharedPrefCubit extends Cubit<SharedPrefState> {
  SharedPrefCubit(this._sharedPrefRepo) : super(SharedPrefInitial());
  final SharedPrefRepo _sharedPrefRepo;

  Future<bool> getBool({required String key}) async {
    return await _sharedPrefRepo.getBool(key).then((value) {
      emit(SharedPrefGetSuccess());
      return value;
    });
  }
}
