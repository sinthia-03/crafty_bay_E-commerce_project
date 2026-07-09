import 'package:crafty_bay/core/service/network_caller/network_caller.dart';

NetworkCaller getNetworkcaller(){ // configuration file headr pass er networkcaller insatar return kore api call
  return NetworkCaller(
    headers: ()=>{
    'content-type': 'application/json',
    //'access-token':'token'
  },
  );

}

