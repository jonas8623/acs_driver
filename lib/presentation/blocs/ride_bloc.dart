import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_ambev_test/data/dtos/ride_dto.dart';
import 'package:uber_ambev_test/data/repositories/repositories.dart';
import 'package:uber_ambev_test/domain/repositories/repositories.dart';
import 'package:uber_ambev_test/presentation/blocs/blocs.dart';

class RideBloc extends Bloc<RideEvent, RideState> {

  final RideRepository _rideRepository = RideRepositoryImplement();

  RideBloc() : super(RideInitialState()) {

    on<RideInitialEvent>((event, emit) => emit(RideInitialState()));
    on<SaveRideEvent>((event, emit) => _mapToStateSaveRide(event, emit));
    on<LoadRideEvent>((event, emit) => _mapToStateFetchAll(event, emit));
    on<UpdateRideEvent>((event, emit) => _mapToStateUpdateRide(event, emit));
  }

  Future<void> _mapToStateSaveRide(SaveRideEvent event, Emitter<RideState> emit) async {

    emit(LoadingRideState());

    try {
      bool? save = await _rideRepository.save(event.ride);

      if(save!) {
        emit(MessageRegistrationSuccessfulState(message: 'Salvo com Sucesso'));
      } else {
        emit(UnsuccessfulMessageRegistrationState(message: 'Não foi possivel salvar sua corrida'));
      }
    } catch(error) {
      emit(ErrorMessageState(message: 'Aconteceu algum erro ao salvar a corrida: $error'));
    }
  }

  Future<void> _mapToStateFetchAll(LoadRideEvent event, Emitter<RideState> emit) async {

    emit(LoadingRideState());

    try {
      List<RideDto>? listRacesDTO = await _rideRepository.fetchAll();

      if(listRacesDTO.isEmpty) {
        emit(MessageRegistrationSuccessfulState(message: 'A Lista está vazia'));
      } else if(listRacesDTO.isNotEmpty) {
        emit(ListLoadSuccessState(listRacesDTO));
      }

    } catch(error) {
        emit(ErrorMessageState(message: 'Erro ao carregar: $error'));
    }
  }

  Future<void> _mapToStateUpdateRide(UpdateRideEvent event, Emitter<RideState> emit) async {

    emit(LoadingRideState());

    try {
      bool? editRice = (await _rideRepository.update(event.ride)) as bool?;

      if (editRice!) {
        emit(RideMessageUpdatedSuccess('Corrida atualizada com sucesso'));
      } else {
        emit(MessageUpdatedUnsuccessfulState('Não foi possivel atualizar a corrida'));
      }
    } catch(error) {
      emit(ErrorMessageState(message: 'Ops, aconteceu algum erro ao atualizar a lista: $error'));
    }
  }
}