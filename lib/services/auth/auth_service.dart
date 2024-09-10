import 'package:local_auth/local_auth.dart';
import 'package:municipium/bloc/cubit/user_data_cubit/user_data_cubit.dart';

enum AuthStatus { fullAuth, semiAuth, notAuth }

class AuthService {
  final UserDataCubit userCubit;
  final LocalAuthentication auth;

  AuthService(this.userCubit, this.auth);

  Future<AuthStatus> getAuthStatus() async {
    final user = userCubit.state;
    final isDeviceSupported = await auth.isDeviceSupported();
    final hasBiometrics = isDeviceSupported && (await auth.canCheckBiometrics);

    if (user.authId != null) {
      if (hasBiometrics) {
        // Controlla se l'utente ha eseguito l'accesso biometrico o tramite sequenza.
        bool authenticated = await auth.authenticate(
          localizedReason: 'Autenticati per accedere all\'app',
          options: const AuthenticationOptions(biometricOnly: true),
        );
        return authenticated ? AuthStatus.fullAuth : AuthStatus.semiAuth;
      } else {
        return AuthStatus.semiAuth;
      }
    }
    return AuthStatus.notAuth;
  }
}
