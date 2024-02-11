import 'package:counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ***********************************************************************************
/// var obj2 = BlocProvider.of(context); special way to create object from cubit(bloc)
// ***********************************************************************************

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit():super(CounterInitialState());

  // to be more easily when use this cubit (Bloc)
  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 0;

  void minus(){
    counter--;
    emit(CounterMinusState(counter));
  }

  void plus(){
    counter++;
    emit(CounterPlusState(counter));
  }

  void reset(){
    counter = 0;
    emit(CounterResetState());
  }
}