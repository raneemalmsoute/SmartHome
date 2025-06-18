import '../../core/class/crud.dart';
import '../../serverLink.dart'     ;
class LoginData{
  Crud crud =Crud()    ;
  login(String email,String password)async{
    print(email);
    print(password);
    var response = await crud.postData(ServerLink.login,
        {
          'email':email         ,
          'password':password
        }) ;

    return response.fold((l) => l, (r) => r) ;
  }
}