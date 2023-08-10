import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

import '../dependency_injection/dependency_injection.dart';

final getIt = GetIt.instance;

List<SingleChildWidget> get blocProviders => [
      BlocProvider(
        create: (context) => PrincipalInfoBloc(
          cacheLastCitation: getIt<CacheLastCitationUsecase>(),
          getLocalCitation: getIt<GetLocalCitationUsecase>(),
          getRemoteCitation: getIt<GetRemoteCitationUsecase>(),
        )..add(PrincipalInfoInitialize()),
      ),
    ];
