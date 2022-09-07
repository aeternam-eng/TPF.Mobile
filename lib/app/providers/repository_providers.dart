import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stronzotpfmobile/app/repositories/user.repository.dart';

final userRepositoryProvider = Provider((ref) => UserRepository(ref.read));
