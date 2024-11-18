part of 'dependency_injector.dart';

final List<Provider> _customService = [
  Provider<AuthService>(
      create: (context) => AuthService(context.read<UserDataCubit>(), context.read<LocalAuthentication>() ),
    ),
    Provider<ServiceAccessManager>(
      create: (context) => ServiceAccessManager(context.read<AuthService>()),
      lazy: false, // Imposta su `false` se vuoi che l'istanza sia creata al momento dell'inizializzazione dell'app
    ),
];

