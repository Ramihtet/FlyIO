import 'package:flutter/material.dart';
import 'package:flyio/InfoScreen/screen.dart';
import 'package:flyio/Profile//bar.dart';
import 'package:flyio/List/Page.dart';
import 'dart:convert';
import 'package:flyio/iata-airports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flyio/main.dart';
import 'package:flyio/AirportSearch/airportsearch.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class Airport_page extends StatefulWidget {
  @override
  Bingo3 createState() => Bingo3();
}
var country = "";
var countryCon = TextEditingController();
AutoCompleteTextField searchTextField;
GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
class Bingo3 extends State<Airport_page> {
//  void initState() {
//    super.initState();
////    print(stops_dep[0].arrival.iataCode.toString());
//  }
  Widget row(String user) {
    return Wrap(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          user,
          style: TextStyle(fontSize: 16.0),
        ),

      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Stack(children: <Widget>[
              Bar(height: 2000.0),
              Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,90,40,0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(color:Colors.white,child:
//                          TextField(controller: countryCon,decoration: InputDecoration(
//                            labelText: "Enter Country",
//                          ))
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                            child:
                            searchTextField = AutoCompleteTextField<String>(
                              key: key,
                              clearOnSubmit: false,
                              suggestions: countryList,
                              suggestionsAmount: 4,
                              controller: countryCon,
                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                              decoration: InputDecoration(
                                labelText: "Enter Country Name",
                              ),
                              itemFilter: (item, query) {
                                return item
                                    .toLowerCase()
                                    .startsWith(query.toLowerCase());
                              },
                              itemSorter: (a, b) {
                                return a.compareTo(b);
                              },
                              itemSubmitted: (item) {
                                setState(() {
                                  searchTextField.textField.controller.text = item;
                                });
                              },
                              itemBuilder: (context, item) {
                                // ui for the autocompelete row
                                return row(item);
                              },
                            ),
                          )



                          ),
                        ),
                        IconButton(icon: Icon(Icons.search), onPressed: (){setState(() {
                          country = countryCon.text;
                        });})
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 400,
                      width: 500,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: Airport_search[country].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                  child:
                                      Card(
                                          child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Airport Name: "+Airport_search[country][index]["name"]),
                                              Text("City of Airport: "+Airport_search[country][index]["city"]),
                                              Text("IATA: "+Airport_search[country][index]["IATA"]),

                                            ],
                                          ))
                                )

                              ],
                            ));



                        }

                    )
                    ),
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
List<String> countryList =
["French Polynesia", "Algeria", "Denmark", "South Africa", "United Arab Emirates", "Russia", "China", "Brazil", "Yemen", "Russian Federation", "Spain", "Iran", "United States", "Ivory Coast", "Ethiopia", "Australia", "Egypt", "Saudi Arabia", "Nigeria", "United Kingdom", "Mexico", "Ghana", "Switzerland", "Turkey", "Jordan", "Colombia", "Chad", "Argentina", "Norway", "Iceland", "Uzbekistan", "Solomon Islands", "Morocco", "France", "Sweden", "Papua New Guinea", "Greenland", "India", "Paraguay", "Venezuela", "Italy", "Honduras", "Cook Islands", "Comoros", "Libya", "Japan", "New Zealand", "Canada", "Kazakhstan", "Myanmar", "Syria", "Indonesia", "Netherlands", "Madagascar", "Chile", "Belgium", "Antigua and Barbuda", "Germany", "Greece", "Malaysia", "Mozambique", "Samoa", "Peru", "Tanzania", "Romania", "Turkmenistan", "Bahamas", "St. Helena", "Eritrea", "Kenya", "Sudan", "Mauritania", "Aruba", "Vanuatu", "Anguilla", "Dominican Republic", "Philippines", "Bahrain", "Botswana", "Somalia", "Cuba", "Costa Rica", "Bermuda", "Nepal", "Serbia", "Lebanon", "Thailand", "Central African Republic", "Barbados", "Iraq", "Pakistan", "Marshall Islands", "Gambia", "Burundi", "Mali", "Congo", "Malawi", "Vietnam", "New Caledonia", "Bosnia and Herzegovina", "Panama", "Bulgaria", "Netherlands Antilles", "Burkina Faso", "Czech Republic", "Equatorial Guinea", "Slovakia", "Hungary", "Zimbabwe", "Georgia", "Cape Verde", "Croatia", "Brunei", "Mongolia", "Belize", "Poland", "Bangladesh", "Angola", "Haiti", "French Guiana", "Bolivia", "Cocos (Keeling) Islands", "Ireland", "Zambia", "Saint Vincent and the Grenadines", "South Korea", "Guinea", "Sri Lanka", "Benin", "Senegal", "Ecuador", "Portugal", "Ukraine", "Kiribati", "Cayman Islands", "Taiwan", "Dominica", "Tunisia", "Cameroon", "Qatar", "Tajikistan", "Mayotte", "Uganda", "Cyprus", "British Virgin Islands", "", "Finland", "Namibia", "Israel", "Tonga", "Armenia", "Faroe Islands", "Martinique", "Democratic Republic of Congo", "Sierra Leone", "North Korea", "Guatemala", "Kyrgyzstan", "Saint Pierre and Miquelon", "Tuvalu", "Wallis and Futuna Islands", "Maldives", "Gabon", "Guadeloupe", "Turks And Caicos Islands", "Guyana", "Gibraltar", "Grenada", "Austria", "Azerbaijan", "Afghanistan", "Hong Kong", "Lao People's Democratic Republic", "Fiji", "Nauru", "Niue", "Djibouti", "Estonia", "Rwanda", "Oman", "Jamaica", "Moldova", "Federated States of Micronesia", "Lithuania", "Kuwait", "Togo", "Slovenia", "Laos", "Latvia", "Luxembourg", "Monaco", "Macau", "Nicaragua", "Belarus", "Malta", "Liberia", "Falkland Islands", "Mauritius", "Lesotho", "Swaziland", "Uruguay", "Saint Kitts and Nevis", "Niger", "Norfolk Island", "Cote D'Ivoire", "Macedonia", "Guinea-Bissau", "Cambodia", "Bhutan", "Suriname", "Trinidad and Tobago", "Seychelles", "Palau", "Reunion", "El Salvador", "Singapore", "St. Lucia", "Montenegro", "Albania", "Libyan Arab Jamahiriya", "Northern Mariana Islands", "Sao Tome and Principe", "Western Sahara", "Christmas Island", "Macao", "Antarctica"];