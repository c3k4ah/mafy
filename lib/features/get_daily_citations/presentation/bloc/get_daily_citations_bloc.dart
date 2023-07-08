import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_daily_citations_event.dart';
part 'get_daily_citations_state.dart';

class GetDailyCitationsBloc
    extends Bloc<GetDailyCitationsEvent, GetDailyCitationsState> {
  GetDailyCitationsBloc() : super(GetDailyCitationsInitial()) {
    on<GetDailyCitationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
