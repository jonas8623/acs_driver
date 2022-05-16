import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_ambev_test/domain/entities/entities.dart';
import 'package:uber_ambev_test/presentation/blocs/blocs.dart';
import '../../data/dtos/race_dto.dart';

class ConfirmedRacesPage extends StatefulWidget {
  const ConfirmedRacesPage({Key? key}) : super(key: key);

  @override
  _ConfirmedRacesPageState createState() => _ConfirmedRacesPageState();
}

class _ConfirmedRacesPageState extends State<ConfirmedRacesPage> {

  late final RaceBloc bloc;
  final RaceEntity raceEntity = RaceEntity();

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

  Widget _cards(RaceDTO raceDTO) {
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
              _filledField('ID', '000000000'),
              const SizedBox(height: 8.0),
              _filledField('Nome do Passageiro', '${raceDTO.passengerNameDTO}'),
              const SizedBox(height: 8.0),
              _filledField('Cidade de Destino','${raceDTO.cityDTO}'),
              const SizedBox(height: 8.0),
              _filledField('Bairro de Destino', '${raceDTO.districtDTO}'),
              const SizedBox(height: 8.0),
              _filledField('Data e Hora', '${raceDTO.createAtDTO}'),
              const SizedBox(height: 8.0),
              _filledField('Vagas disponiveis','2'),
            ],
          ),
        ),
    );
  }

  @override
  void initState() {
     bloc = RaceBloc();
     bloc.add(LoadRaceEvent());
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
        child: BlocBuilder<RaceBloc, RaceState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is LoadingRaceState) {
                return const Center(child: CircularProgressIndicator(
                    color: Color.fromRGBO(250, 133, 63, 0.9)),);
              } else if (state is MessageErrorState) {
                return Center(
                  child: Text(state.message),);
              } else if (state is ListLoadSuccessState) {
                  final raceList = state.races;
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


