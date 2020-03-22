import 'package:flutter/material.dart';


class ProfileCardAlignment extends StatelessWidget {
  var cardNum;
  ProfileCardAlignment(this.cardNum);

  Widget Images(index)
  {
    List<Widget> list = new List<Widget>();
    list.add(Image.asset('assets/UK.jpeg', fit: BoxFit.cover),);
    list.add(Image.network('https://i.insider.com/5a9dbd83e6a9cf1b008b46ad?width=800&format=jpeg&auto=webp', fit: BoxFit.cover),);
    list.add(Image.network('https://i.insider.com/5ba905d733db9e90438b4568?width=800&format=jpeg&auto=webp', fit: BoxFit.cover),);
    list.add(Image.network('https://i.insider.com/5ab137f5b085c0d3118b4a89?width=700&format=jpeg&auto=webp', fit: BoxFit.cover),);
    list.add(Image.network('https://i.insider.com/5b8472212be4ab1c008b57cd?width=700&format=jpeg&auto=webp', fit: BoxFit.cover),);
    list.add(Image.network('https://i.insider.com/5ba90376ea40025e428b4567?width=700&format=jpeg&auto=webp', fit: BoxFit.cover),);
    list.add(Image.network('https://i.insider.com/56aa8a7f58c3238c008b61fa?width=700&format=jpeg&auto=webp', fit: BoxFit.cover),);
    list.add(Image.network('https://i.insider.com/5982deea4fc3c057008b49c8?width=700&format=jpeg&auto=webp', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/moscow-1200x675.png', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/jace-afsoon-179788-unsplash-1024x683.jpg', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/riydh.jpg', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/ricardo-gomez-angel-396552-unsplash-1024x682.jpg', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/barcelona-1024x683.jpg', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/mike-boening-116749-unsplash-1024x830.jpg', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/los-angeles-1200x675.jpg', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/Abraj-Al-Bait-Towers-1024x680.jpg', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/anthony-delanoix-575672-unsplash-1024x683.jpg', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/sarah-doffman-639546-unsplash-1200x675.jpg', fit: BoxFit.cover),);
    list.add(Image.network('https://bigseventravel.com/wp-content/uploads/2019/03/Dubai-pic.jpg', fit: BoxFit.cover),);
    return list[index];
  }

  List<String> Citites= ["London, United Kingdom","Bali, Indonesia","Osaka, Japan","Phuket, Thailand",
  "Antalya, Turkey", "Istanbul, Turkey" , "Kaula Lumpur, Malaysia", "Paris, France","Moscow, Russia",
  "Venice, Italy","Ryadh, Saudi Arabia","Berlin, Germany","Barcelona, Spain",
  "Las Vegas, US","Mecca, Saudi Arabia","Prague, Czech Republic","Rome, Italy",
  "Dubia, UAE"];
  List<String> Quotes=["Get the ultimate Harry Potter weekend in London",
    " Live an endless magical summer in Bali",
    " Tokyo may have more money and Kyoto more culture; Nara may have more history and Kobe more style. But Osaka has the biggest heart",
    " Do you need any vitamin SEA?", "Wanna dive into summer vibes, visit antalya",
    "Explore the city that has its own code of art",
    "From a bustling capital to the silky beaches, there are a ton of things to do in Kuala Lumpu",
    "Ever dreamed of taking a selfie near the Eiffel Tower? ", "Take a flashback to the ancient cathedrals in Moscow",
    " Venice is like eating an entire box of chocolate liqueurs in one go", "Take a sneak peek to the Arabic History",
    " Wanna experience a combo of NY's culture,Tokyo's traffic,Seattle's nature and well historcial treasures?",
    " Feel free to dance down in the streets in Barcelona!" ,"You cant buy happiness but you can go to Vegas",
    "Ever dreamed of being a star? LA is the way", "They say New York never sleeps. They haven't seen Mecca yet.",
    "Prague isn't just a city, but an entity of some kind",
    "Wanna go through history?Go to Rome!", "Shop till you drop"];

  setState(){
    if(cardNum==18){cardNum = 0;}
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              child: Images(cardNum),
            ),
          ),
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(Citites[cardNum],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700)),
                    Padding(padding: EdgeInsets.only(bottom: 8.0)),
                    Text(Quotes[cardNum],
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white)),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
