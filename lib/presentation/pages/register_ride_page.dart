import 'package:date_format/date_format.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uber_ambev_test/data/dtos/ride_dto.dart';
import 'package:intl/intl.dart';
import '../../core/routes/routes.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class RegisterRidePage extends StatefulWidget {
  const RegisterRidePage({Key? key}) : super(key: key);

  @override
  _RegisterRidePageState createState() => _RegisterRidePageState();
}

class _RegisterRidePageState extends State<RegisterRidePage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController ambevIdController = TextEditingController();
  TextEditingController addressOriginController = TextEditingController();
  final TextEditingController cityDestinationController = TextEditingController();
  final TextEditingController addressDestinationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController passengerNameController = TextEditingController();
  bool readOnly = false;
  DateTimeFormatUseCase getFormattedDate = DateTimeFormatImplement();

  ComponentTextFormField _fields({
    required TextEditingController controller,
    required TextInputType keyboard,
    required IconData icon,
    String? text,
    int? maxLength,
    MaskTextInputFormatter? formatter,
    Function(String)? onChanged,
  }) {
    return ComponentTextFormField(
        controller: controller,
        keyboard: keyboard,
        icon: icon,
        text: text,
        maxLength: maxLength,
        formatter: formatter,
        onChanged: onChanged,
    );
  }

  Widget _padding(Widget child) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.5, 0.0, 10.5, 0.0),
        child: child,
    );
  }

  Widget _requestFields() {
    return Container(
      color: Colors.orangeAccent.withOpacity(0.5),
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Campos Obrigatórios", style: TextStyle(fontWeight: FontWeight.bold),),
              Icon(Icons.star, color: Colors.red, size: 16,)
            ],
          ),
      )
    );
  }

  Widget _showTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.5, 4.0, 10.5, 6.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.star, color: Colors.red, size: 14),
          const SizedBox(width: 6.5),
          SizedBox(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        ],
      ),
    );
  }

  Widget _textFormField(BuildContext context) {
      return Column(
        children: [
          TextFormField(
            controller: addressOriginController,
            readOnly: !readOnly,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Theme.of(context).primaryColor,),
              ),
              prefixIcon: Icon(Icons.wrong_location_outlined, color: Theme.of(context).primaryColor,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Theme.of(context).primaryColor,),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Alterar local de partida'),
              Switch(
                value: readOnly,
                onChanged: (value) {
                  setState(() {
                    readOnly = value;
                  });
                },
                activeColor: const Color.fromRGBO(250, 133, 63, 1),
              ),
            ],
          )

        ],
      );
  }

  DateTimePicker _dateTimePicker() {
    return DateTimePicker(
      controller: dateController,
      locale: const Locale('pt', 'BR'),
      icon: const Icon(Icons.calendar_today),
      lastDate: DateTime(2100),
      dateMask: 'dd, MMM, yyyy HH:ss',
      firstDate: DateTime.now(),
      errorInvalidText: 'Data inválida',
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Theme.of(context).primaryColor,),
        ),
        prefixIcon: Icon(Icons.calendar_today, color: Theme.of(context).primaryColor,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Theme.of(context).primaryColor,),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),),
      type: DateTimePickerType.dateTime,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Insira uma data válida';
        }
        return null;
      },
    );
  }

  Widget button(BuildContext context, RideBloc bloc) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(250, 133, 63, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(250, 133, 63, 1),),
                  borderRadius: BorderRadius.circular(16)
              ),
              child: TextButton.icon(
                onPressed: () async => _saveRepository(bloc),
                icon: const Icon(Icons.add_circle, color: Colors.white),
                label: const Text('Solicitar Corrida', style: TextStyle(color: Colors.white)),
              )
          )
      ),
    );
  }

  @override
  void initState() {
    addressOriginController = TextEditingController(text: 'Padrão');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final raceBloc = BlocProvider.of<RideBloc>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Solicitar Corrida'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: BlocListener<RideBloc, RideState>(
          listener: (context, state) {
            if (state is MessageRegistrationSuccessfulState) {
              _displayMessage(state.message);
              Navigator.pushNamed(context, AppRoutes.routeHome);
            } else if (state is UnsuccessfulMessageRegistrationState) {
              _displayMessage(state.message);
            } else if(state is ErrorMessageState) {
              _displayMessage(state.message);
            }
          },
          child: BlocBuilder<RideBloc, RideState>(
              bloc: raceBloc,
              builder: (context, state) {
                if (state is LoadingRideState) {
                  return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor),);
                } else if (state is RideInitialState) {
                  return Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          _requestFields(),
                          const SizedBox(height: 16.0,),
                          _showTitle(title: 'ID'),
                           _padding(_fields(controller: ambevIdController, keyboard: TextInputType.number, icon: Icons.app_registration_outlined, maxLength: 8)),
                          const SizedBox(height: 16.0,),
                          _showTitle(title: 'Nome do Passageiro'),
                          _padding(
                            _fields(controller: passengerNameController, keyboard: TextInputType.name, icon: Icons.info_outline_rounded,),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0, top: 12.0),
                                child: FloatingActionButton(
                                    onPressed: () {},
                                    tooltip: 'Adicionar Passageiro',
                                    child: const Icon(Icons.person_add_alt_1_outlined),
                                    backgroundColor: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                          _showTitle(title: 'Endereço de Partida'),
                          _padding(_textFormField(context)),
                          const SizedBox(height: 16.0,),
                          _showTitle(title: 'Cidade de Destino'),
                          _padding(_fields(controller: cityDestinationController, keyboard: TextInputType.text, icon: Icons.location_city,)),
                          const SizedBox(height: 16.0,),
                          _showTitle(title: 'Endereço de Destino'),
                          _padding(_fields(controller: addressDestinationController, keyboard: TextInputType.streetAddress, icon: Icons.location_city),),
                          const SizedBox(height: 16.0,),
                          _showTitle(title: 'Data e Hora de Destino'),
                          _padding(_dateTimePicker()),
                          const SizedBox(height: 12.0,),
                          button(context, raceBloc)
                        ],
                      ),
                  );
                }
                return Container();
              }
          ),
        ),
      ),
    );
  }

  // String getFormattedDate(String date) {
  //   var localDate = DateTime.parse(date).toLocal();
  //
  //   var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  //   var inputDate = inputFormat.parse(localDate.toString());
  //
  //   return formatDate(inputDate, [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]);
  // }

  _saveRepository(RideBloc bloc) async {
    if(_formKey.currentState!.validate()) {
      bloc.add(SaveRideEvent(ride: RideEntity(
          ambevId: ambevIdController.text,
          addressOrigin: addressOriginController.text,
          cityDestination: cityDestinationController.text,
          addressDestination: addressDestinationController.text,
          dateRide: getFormattedDate(dateController.text),
          listPassengers: passengerNameController.text,
      )),);
    }
  }

  _displayMessage(String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  // _resetFields() => _formKey.currentState!.reset();
}
