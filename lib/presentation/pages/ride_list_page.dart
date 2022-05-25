import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_ambev_test/presentation/blocs/blocs.dart';
import '../../data/dtos/ride_dto.dart';
import '../../domain/domain.dart';

class RideListPage extends StatefulWidget {
  const RideListPage({Key? key}) : super(key: key);

  @override
  _RideListPageState createState() => _RideListPageState();
}

class _RideListPageState extends State<RideListPage> {

  late final RideBloc bloc;
  final RideEntity raceEntity = RideEntity();

  Widget _textDescription({required String description}) => Text('$description: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),);
  Widget _text({required String text}) => Text(text, style: const TextStyle(fontSize: 16, letterSpacing: 1.1),);
  Widget _filledField(String description, String text) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          children: [
            _textDescription(description: description),
            _text(text: text.toUpperCase())
        ],
    ),);
  }

  Widget _cards(RideDto rideDTO) {
    return Container(
        height: 257,
        width: double.infinity,
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(250, 133, 63, 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(2, 2)
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person_add, size: 30)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit, size: 30)),
                  IconButton(icon: const Icon(Icons.delete, size: 30), onPressed: () {})
                ],
              ),
              _filledField('ID', '${rideDTO.ambevIdDto}'),
              const SizedBox(height: 8.0),
              _filledField('Nome do Passageiro', '${rideDTO.listPassengersDto}'),
              const SizedBox(height: 8.0),
              _filledField('Endereço de Partida', '${rideDTO.addressOriginDto}'),
              const SizedBox(height: 8.0),
              _filledField('Cidade de Destino','${rideDTO.cityDestinationDto}'),
              const SizedBox(height: 8.0),
              _filledField('Endereço de Destino', '${rideDTO.addressDestinationDto}'),
              const SizedBox(height: 8.0),
              _filledField('Data e Hora', '${rideDTO.statusDto}'),
              const SizedBox(height: 8.0),
              _filledField('Vagas disponiveis','2'),
            ],
          ),
        ),
    );
  }

  @override
  void initState() {
     bloc = RideBloc();
     bloc.add(LoadRideEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final _raceBloc = BlocProvider.of<RaceBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corridas Confirmadas'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<RideBloc, RideState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is LoadingRideState) {
                return const Center(child: CircularProgressIndicator(
                    color: Color.fromRGBO(250, 133, 63, 0.9)),);
              } else if (state is ErrorMessageState) {
                return Center(
                  child: Text(state.message),);
              } else if (state is ListLoadSuccessState) {
                  final raceList = state.listRides;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: raceList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: _cards(raceList[index]),
                      );
                    }
                );
              }
              return Container();
            }
        )
      ),
    );
  }
}


