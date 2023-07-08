import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_android_apps_event.dart';
part 'get_android_apps_state.dart';

class GetAndroidAppsBloc
    extends Bloc<GetAndroidAppsEvent, GetAndroidAppsState> {
  GetAndroidAppsBloc() : super(GetAndroidAppsInitial()) {
    on<GetAndroidAppsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
