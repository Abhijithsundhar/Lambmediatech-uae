import '../../../core/failure.dart';
import '../repository/loginrepositery.dart';

class LoginController {
  final AuthRepository _authRepository = AuthRepository(); // Create an instance

  Future<void> signIn(String email, String password) async {
    try {
      final user = await _authRepository.signInWithEmailAndPassword(email, password);
    } on Failure catch (e) {
    } catch (e) {
    }
  }
}