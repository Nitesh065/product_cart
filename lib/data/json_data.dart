
import 'dart:convert';

import '../modal/product_modal.dart';

class JsonData{

  var jsonString = [
    {
      "_id": "60c30c3d54a6468980addbff",
      "price": "\$1,233.81",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Red",
        "Blue"
      ],
      "productName": "COMTEST",
      "brands": [
        {
          "id": 0,
          "name": "Schroeder Valenzuela"
        },
        {
          "id": 1,
          "name": "Gamble Hendrix"
        },
        {
          "id": 2,
          "name": "Pat Gray"
        }
      ]
    },
    {
      "_id": "60c30c3dfe5afa7999c39e52",
      "price": "\$1,440.19",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Red",
        "Blue",
        "Green"
      ],
      "productName": "BOINK",
      "brands": [
        {
          "id": 0,
          "name": "Morgan Weeks"
        },
        {
          "id": 1,
          "name": "Corinne Finch"
        },
        {
          "id": 2,
          "name": "Jo Dorsey"
        }
      ]
    },
    {
      "_id": "60c30c3de6a2c2ea92535e94",
      "price": "\$2,036.82",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Blue",
        "Green"
      ],
      "productName": "DOGSPA",
      "brands": [
        {
          "id": 0,
          "name": "Erickson Sanders"
        },
        {
          "id": 1,
          "name": "Haney Mcclure"
        },
        {
          "id": 2,
          "name": "Karla Durham"
        }
      ]
    },
    {
      "_id": "60c30c3de4c16dadb861c5a0",
      "price": "\$1,898.12",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Red",
        "Blue"
      ],
      "productName": "DATACATOR",
      "brands": [
        {
          "id": 0,
          "name": "Lilly Simon"
        },
        {
          "id": 1,
          "name": "Brooke Gallegos"
        },
        {
          "id": 2,
          "name": "Carla Ellison"
        }
      ]
    },
    {
      "_id": "60c30c3d699af5b7ed621070",
      "price": "\$1,109.99",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Red",
        "Blue",
        "Green"
      ],
      "productName": "ACCUPRINT",
      "brands": [
        {
          "id": 0,
          "name": "Vasquez Gillespie"
        },
        {
          "id": 1,
          "name": "Rasmussen Dunn"
        },
        {
          "id": 2,
          "name": "Yang Dean"
        }
      ]
    },
    {
      "_id": "60c30c3daf092fed381dba9d",
      "price": "\$3,433.40",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Red",
        "Green"
      ],
      "productName": "COLLAIRE",
      "brands": [
        {
          "id": 0,
          "name": "Diaz Henderson"
        },
        {
          "id": 1,
          "name": "Bianca Banks"
        },
        {
          "id": 2,
          "name": "Heather Blevins"
        }
      ]
    },
    {
      "_id": "60c30c3dba2f588ea4301e9c",
      "price": "\$1,325.10",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Blue",
        "Green"
      ],
      "productName": "ZOSIS",
      "brands": [
        {
          "id": 0,
          "name": "Gonzalez Barlow"
        },
        {
          "id": 1,
          "name": "Young Bernard"
        },
        {
          "id": 2,
          "name": "Moses Kirk"
        }
      ]
    },
    {
      "_id": "60c30c3d1ead8a0ce227274b",
      "price": "\$2,217.90",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Red",
        "Blue",
        "Green"
      ],
      "productName": "MICROLUXE",
      "brands": [
        {
          "id": 0,
          "name": "Mayo Cook"
        },
        {
          "id": 1,
          "name": "Kelly Andrews"
        },
        {
          "id": 2,
          "name": "Pierce Hubbard"
        }
      ]
    },
    {
      "_id": "60c30c3d5cfeea8fc250ad9a",
      "price": "\$3,608.41",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Red"
      ],
      "productName": "ENOMEN",
      "brands": [
        {
          "id": 0,
          "name": "Cathleen Wall"
        },
        {
          "id": 1,
          "name": "Doreen Skinner"
        },
        {
          "id": 2,
          "name": "Romero Kim"
        }
      ]
    },
    {
      "_id": "60c30c3d5abce6bec089233f",
      "price": "\$1,477.75",
      "picture": "http://placehold.it/256x256",
      "colors": [
        "Red",
        "Blue",
        "Green"
      ],
      "productName": "MOMENTIA",
      "brands": [
        {
          "id": 0,
          "name": "Lorraine Schmidt"
        },
        {
          "id": 1,
          "name": "Minerva Robles"
        },
        {
          "id": 2,
          "name": "Katheryn Park"
        }
      ]
    }
  ];

}

class JsonConvert {
  List<ProductData>? getData() {
    // var demoModel = null;
    try {
      var jsonString = json.encode(JsonData().jsonString );
      // List<Map<String, dynamic>> jsonDecode = json.decode(jsonString);
     List<ProductData> demoModel = productDataFromJson(jsonString);
      print(demoModel);
      return demoModel;
    }
    catch(e){
      print(e.toString());
    }
  }
}