import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/auth_response.model.dart';
import '../repositories/login.repository.dart';

class AuthNotifier extends StateNotifier<AsyncValue<AuthResponse?>> {
  final _authRepository = AuthRepository();

  AuthNotifier() : super(const AsyncValue.data(null));

  Future<void> authenticate(String login, String password) async {
    try {
      state = const AsyncValue.loading();
      state =
          AsyncValue.data(await _authRepository.authenticate(login, password));
    } catch (e) {
      state = AsyncValue.error(e.toString());
    }
  }
}
