import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_ambev_test/data/dtos/race_dto.dart';
import 'package:uber_ambev_test/data/repositories/repositories.dart';
import 'package:uber_ambev_test/domain/repositories/repositories.dart';
import 'package:uber_ambev_test/presentation/blocs/blocs.dart';

class RaceBloc extends Bloc<RaceEvent, RaceState> {

  final RaceRepository _raceRepository = RaceRepositoryImplement();

  RaceBloc() : super(RaceInitialState()) {

    on<RaceInitialEvent>((event, emit) => emit(RaceInitialState()));
    on<SaveRaceEvent>((event, emit) => _listSaveSuccess(event, emit));
    on<LoadRaceEvent>((event, emit) => _listRaceSuccess(event, emit));
  }

  Future<void> _listSaveSuccess(SaveRaceEvent event, Emitter<RaceState> emit) async {

    emit(LoadingRaceState());

    try {
      bool? save = await _raceRepository.save(event.race);

      if(save!) {
        emit(MessageSaveSuccessState(message: 'Salvo com Sucesso'));
      } else {
        emit(RegisterMessageState(message: 'Não foi possivel salvar sua corrida'));
      }
    } catch(error) {
      emit(MessageErrorState(message: 'Aconteceu algum erro ao salvar a corrida $error'));
    }
  }

  Future<void> _listRaceSuccess(LoadRaceEvent event, Emitter<RaceState> emit) async {

    emit(LoadingRaceState());

    try {
      List<RaceDTO>? raceDTO = await _raceRepository.fetchAll();

      if(raceDTO.isEmpty) {
        emit(RegisterMessageState(message: 'A Lista está vazia'));
      } else if(raceDTO.isNotEmpty) {
        emit(ListLoadSuccessState(raceDTO));
      }

    } catch(error) {
        emit(MessageErrorState(message: 'Erro ao carregar'));
    }
  }
}