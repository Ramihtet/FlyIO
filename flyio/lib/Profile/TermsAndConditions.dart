import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            title: Text("Terms and Conditions", style: TextStyle(fontFamily: 'Anton', color: Colors.white70),),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white70),
              onPressed: () => Navigator.of(context).pop(),
            )
        ),
        body: Stack(children: <Widget>[
          new ListView(
              children: <Widget>[
                new Column(
                    children: <Widget>[
                      Text("General", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Card(child:Text("These terms and conditions (\"Terms\", \"Agreement\") are an agreement between Mobile Application Developer (\"Mobile Application Developer\", \"us\", \"we\" or \"our\") and you (\"User\", \"you\" or \"your\"). This Agreement sets forth the general terms and conditions of your use of the FlyIO mobile application and any of its products or services (collectively, \"Mobile Application\" or \"Services\").\n\n"
                      ))
                    ]
                ),
                new Column(
                    children: <Widget>[
                      Text("Accounts and membership", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Card(child:Text(
                          "You must be at least 13 years of age to use this Mobile Application. By using this Mobile Application and by agreeing to this Agreement you warrant and represent that you are at least 13 years of age. If you create an account in the Mobile Application, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account and any other actions taken in connection with it. We may, but have no obligation to, monitor and review new accounts before you may sign in and use our Services. Providing false contact information of any kind may result in the termination of your account. You must immediately notify us of any unauthorized uses of your account or any other breaches of security. We will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions. We may suspend, disable, or delete your account (or any part thereof) if we determine that you have violated any provision of this Agreement or that your conduct or content would tend to damage our reputation and goodwill. If we delete your account for the foregoing reasons, you may not re-register for our Services. We may block your email address and Internet protocol address to prevent further registration.\n\n"
                      ),)
                    ]
                ),
                new Column(
                    children: <Widget>[
                      Text("Links to other mobile applications", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Card(child:Text(
                        "Although this Mobile Application may link to other mobile applications, we are not, directly or indirectly, implying any approval, association, sponsorship, endorsement, or affiliation with any linked mobile application, unless specifically stated herein. We are not responsible for examining or evaluating, and we do not warrant the offerings of, any businesses or individuals or the content of their mobile applications. We do not assume any responsibility or liability for the actions, products, services, and content of any other third-parties. You should carefully review the legal statements and other conditions of use of any mobile application which you access through a link from this Mobile Application. Your linking to any other off-site mobile applications is at your own risk.\n\n"
                      ),)
                    ]
                ),
                new Column(
                    children: <Widget>[
                      Text("Intellectual property rights", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Card(child:Text(
                        "This Agreement does not transfer to you any intellectual property owned by Mobile Application Developer or third-parties, and all rights, titles, and interests in and to such property will remain (as between the parties) solely with Mobile Application Developer. All trademarks, service marks, graphics and logos used in connection with our Mobile Application or Services, are trademarks or registered trademarks of Mobile Application Developer or Mobile Application Developer licensors. Other trademarks, service marks, graphics and logos used in connection with our Mobile Application or Services may be the trademarks of other third-parties. Your use of our Mobile Application and Services grants you no right or license to reproduce or otherwise use any Mobile Application Developer or third-party trademarks.\n\n"
                      ),)
                    ]
                ),
                new Column(
                    children: <Widget>[
                      Text("Changes and amendments", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Card(child:Text(
                        "We reserve the right to modify this Agreement or its policies relating to the Mobile Application or Services at any time, effective upon posting of an updated version of this Agreement in the Mobile Application. When we do, we will post a notification in our Mobile Application. Continued use of the Mobile Application after any such changes shall constitute your consent to such changes\n\n"
                      ),)
                    ]
                ),
                new Column(
                    children: <Widget>[
                      Text("Acceptance of these terms", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Card(child:Text(
                        "You acknowledge that you have read this Agreement and agree to all its terms and conditions. By using the Mobile Application or its Services you agree to be bound by this Agreement. If you do not agree to abide by the terms of this Agreement, you are not authorized to use or access the Mobile Application and its Services.\n\n"
                      ),)
                    ]
                ),
                new Column(
                    children: <Widget>[
                      Text("Contacting us", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Card(child:Text(
                        "If you would like to contact us to understand more about this Agreement or wish to contact us concerning any matter relating to it, you may send an email to ymf06@mail.aub.edu, rah106@mail.aub.edu, daz04@mail.aub.edu, mac34@mail.aub.edu, mah127@mail.aub.edu.\n\n"
                      ),)
                    ]
                ),
              ]
          )
        ]
        )
    );
  }
}