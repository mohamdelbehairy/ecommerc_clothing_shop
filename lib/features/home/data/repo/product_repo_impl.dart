import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_clot_shop/core/utils/constants.dart';

import 'product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  @override
  void getAllProducts(Function(QuerySnapshot<Map<String, dynamic>>)? onData) {
    FirebaseFirestore.instance
        .collection(Constants.productsCollection)
        // .where('createdTime',
        //     isGreaterThanOrEqualTo:
        //         DateTime.now().subtract(const Duration(days: 1)))
        .snapshots()
        .listen(onData);
  }
}
