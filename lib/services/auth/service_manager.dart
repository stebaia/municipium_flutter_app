import 'package:flutter/material.dart';
import 'package:municipium/model/menu/menu_item.dart';
import 'package:municipium/utils/enum.dart';
import 'auth_service.dart';
import 'package:flutter/material.dart';
import 'package:municipium/model/menu/menu_item.dart';
import 'package:municipium/utils/enum.dart';
import 'auth_service.dart';

class ServiceAccessManager {
  final AuthService authService;


  ServiceAccessManager(this.authService);

  Future<bool> handleServiceAccess(String serviceName, BuildContext context) async {
    AuthStatus status = await authService.getAuthStatus();
    //bool requiresBiometrics = biometricRequirementAfterAuth[MenuItemType.values.firstWhere((type) => type.toString().split('.').last == serviceName, orElse: () => MenuItemType.issue)] ?? false;

    if (status == AuthStatus.notAuth) {
      // Se non autenticato, e il servizio non richiede autenticazione obbligatoria, mostra dialog e permetti l'accesso
      //showModal("Accesso al servizio $serviceName consentito.", context);
      return true;
    } else {
      // Utente autenticato
      
        bool isBiometricAvailable = await authService.auth.canCheckBiometrics;
        if (isBiometricAvailable) {
          //showModal("Accesso al servizio $serviceName autorizzato.", context);
          return true;
        } else {
          showModal("Per accedere a $serviceName, è necessario abilitare un metodo di sblocco biometrico.", context);
          return false;
        }
     
    }
  }

  void showModal(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Autorizzazione"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
