import '../../../domain/export.dart';
import '../../export.dart';
import 'export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'initializer_event.dart';

part 'initializer_state.dart';

class InitializerBloc extends Bloc<InitializerEvent, InitializerState> {
  final InitializerUseCase initializerUseCase;

  InitializerBloc({
    required this.initializerUseCase,
  }) : super(InitializerState());
}
