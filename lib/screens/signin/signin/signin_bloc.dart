import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../authentication/authentication.dart';
import '../../../repositories/repositories.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
    final UserRepository userRepository;
    final AuthenticationBloc authenticationBloc;

    LoginBloc({
        @required this.userRepository,
        @required this.authenticationBloc,
    })  : assert(userRepository != null),
            assert(authenticationBloc != null);

    @override
    LoginState get initialState => LoginInitial();

    @override
    Stream<LoginState> mapEventToState(LoginEvent event) async* {
        if (event is LoginButtonPressed) {
            yield LoginInProgress();

            try {
                final token = await userRepository.authenticate(
                    username: event.username,
                    password: event.password,
                );

                authenticationBloc.add(AuthenticationLoggedIn(token: token));
                yield LoginInitial();
            } catch (error) {
                yield LoginFailure(error: error.toString());
            }
        }
    }
}