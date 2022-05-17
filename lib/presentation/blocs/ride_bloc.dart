import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_ambev_test/data/dtos/race_dto.dart';
import 'package:uber_ambev_test/data/repositories/repositories.dart';
import 'package:uber_ambev_test/domain/repositories/repositories.dart';
import 'package:uber_ambev_test/presentation/blocs/blocs.dart';

class RideBloc extends Bloc<RideEvent, RideState> {

  final RideRepository _rideRepository = RideRepositoryImplement();

  RideBloc() : super(RideInitialState()) {

    on<RaceInitialEvent>((event, emit) => emit(RideInitialState()));
    on<SaveRaceEvent>((event, emit) => _mapToStateSaveRide(event, emit));
    on<LoadRaceEvent>((event, emit) => _mapToStateFetchAll(event, emit));
  }

  Future<void> _mapToStateSaveRide(SaveRaceEvent event, Emitter<RideState> emit) async {

    emit(LoadingRaceState());

    try {
      bool? save = await _rideRepository.save(event.race);

      if(save!) {
        emit(MessageRegistrationSuccessfulState(message: 'Salvo com Sucesso'));
      } else {
        emit(UnsuccessfulMessageRegistrationState(message: 'Não foi possivel salvar sua corrida'));
      }
    } catch(error) {
      emit(ErrorMessageState(message: 'Aconteceu algum erro ao salvar a corrida $error'));
    }
  }

  Future<void> _mapToStateFetchAll(LoadRaceEvent event, Emitter<RideState> emit) async {

    emit(LoadingRaceState());

    try {
      List<RideDTO>? listRacesDTO = await _rideRepository.fetchAll();

      if(listRacesDTO.isEmpty) {
        emit(MessageRegistrationSuccessfulState(message: 'A Lista está vazia'));
      } else if(listRacesDTO.isNotEmpty) {
        emit(ListLoadSuccessState(listRacesDTO));
      }

    } catch(error) {
        emit(ErrorMessageState(message: 'Erro ao carregar'));
    }
  }
}