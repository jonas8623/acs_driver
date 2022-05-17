

class PassengerEntity {

  int? passengerId;
  String? namePassenger;
  String? cityPassenger;
  String? addressPassenger;

  PassengerEntity(
      {this.passengerId,
      this.namePassenger,
      this.cityPassenger,
      this.addressPassenger});
}

/*
[22:04, 16/05/2022] +55 51 9338-9959: {
                    "ride_id":1,
                    "date": "16/05/2021 22:22:00",
                    "user_id": 1232,
                    "created_at": 321,
                    "update_at": 312321,
                    "city_origin": "Viamao",
                    "address_origin": "Ambev",
                    "passengers": [{
                        "name": "Guilherme",
                        "city_destination": "Porto Alegre",
                        "address_destination": "Rua Carazinho 399/204",
                        "created_user_id": 31231,
                        "created_at": 3123}
                    ],
                }
[22:14, 16/05/2022] +55 51 9338-9959: {
                    "ride_id":1,
                    "date": "16/05/2021 22:22:00",
                    "user_id": 1232,
                    "created_at": 321,
                    "update_at": 312321,
                    "city_origin": "Viamao",
                    "address_origin": "Ambev",
                    "status": 1,
                    "price":
                    "passengers": [{
                        "name": "Guilherme",
                        "city_destination": "Porto Alegre",
                        "address_destination": "Rua Carazinho 399/204",
                        "created_user_id": 31231,
                        "created_at": 3123}
                    ],

                }
[22:14, 16/05/2022] +55 51 9338-9959: [ {
                    "ride_id":1,
                    "date": "16/05/2021 22:22:00",
                    "user_id": 1232,
                    "created_at": 321,
                    "update_at": 312321,
                    "city_origin": "Viamao",
                    "address_origin": "Ambev",
                    "status": 1,
                    "price": 20.00
                    "passengers": [{
                        "name": "Guilherme",
                        "city_destination": "Porto Alegre",
                        "address_destination": "Rua Carazinho 399/204",
                        "created_user_id": 31231,
                        "created_at": 3123}
                    ],

                }

 */