import 'package:crafty_bay/core/service/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/presentation/providers/auth_controller.dart';

NetworkCaller getNetworkcaller(){ // configuration file headr pass er networkcaller insatar return kore api call
  return NetworkCaller(
    headers: ()=> {
    'content-type': 'application/json', // method user handelong
    //'access-token':'token'
      if(AuthController.accessToken !=null)
      'token': AuthController.accessToken!
  },
  );

}

