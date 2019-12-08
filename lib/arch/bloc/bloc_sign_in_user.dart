import 'package:flutter_arch/arch/bloc/model/usersession.dart';
import 'package:flutter_arch/arch/bloc/model/userlogin.dart';
import 'package:flutter_arch/arch/bloc/repo/repository_user.dart';
import 'package:rxdart/rxdart.dart';

///Bloc handling Sign In procedure
class UserSignInBloc {
  final UserRepository repo;

  ///Sink used to pass login request
  Sink<UserLogin> get login => _userCredentialsStream.sink;
  final _userCredentialsStream = BehaviorSubject<UserLogin>();
  Stream<UserAuthenticationState> userSigned;

  UserSignInBloc(this.repo) {
    ///userSigned contains results from both login and registration process.
    ///It's instance of broadcastStream to allow multiple listeners attached to it.
    userSigned = Observable.merge([
      _userCredentialsStream.stream.switchMap(_signIn),
      // other login methods go here
    ]).asBroadcastStream();
  }

  void dispose() {
    _userCredentialsStream.close();
  }

  Stream<UserAuthenticationState> _signIn(UserLogin userLogin) async* {
    yield UserAuthenticationLoading();
    try {
      final userSession = await repo.signIn(userLogin);
      yield userSession;
    } catch (e) {
      yield UserUnauthenticated(exception: e);
    }
  }
}
