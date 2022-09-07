import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stronzotpfmobile/app/models/auth.model.dart';
import 'package:stronzotpfmobile/app/models/user.model.dart';
import 'package:stronzotpfmobile/app/notifiers/auth.notifier.dart';
import 'package:stronzotpfmobile/app/notifiers/user.notifier.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<AuthResponse?>>(
        (ref) => AuthNotifier());

final userProvider = StateNotifierProvider<UserNotifier, AsyncValue<User?>>(
    (ref) => UserNotifier(ref.read));
