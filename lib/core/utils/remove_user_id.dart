import 'package:e_clot_shop/core/utils/constants.dart';

import '../../features/shared_pref/data/repo/shared_pref_repo.dart';
import '../../features/shared_pref/data/repo/shared_pref_repo_impl.dart';

Future<void> removeUserId() async {
  final SharedPrefRepo sharedPrefRepo = SharedPrefRepoImpl();
  sharedPrefRepo.remove(Constants.userId);
}
