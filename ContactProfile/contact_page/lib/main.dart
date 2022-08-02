import 'package:flutter/material.dart';

void main() => runApp(ContactProfilePage());

enum APP_THEME { LIGHT, DARK }

class MyAppThemes {
  static ThemeData appThemeLight() {
    //Theme for app
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.indigo.shade800,
      ),

      //Theme for FAB
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }

  static ThemeData appThemeDark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.orange,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        //dark background for FAB
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class ContactProfilePage extends StatefulWidget {
  @override
  _ContactProfilePageState createState() => _ContactProfilePageState();
}

class _ContactProfilePageState extends State<ContactProfilePage> {
  var currentTheme = APP_THEME.LIGHT;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Applying theme based on the current selection.
      theme: currentTheme == APP_THEME.DARK
          ? MyAppThemes.appThemeDark()
          : MyAppThemes.appThemeLight(),

      home: Scaffold(
        appBar: buildAppBarWidget(),
        body: buildBodyWidget(),
        //Code for FAB
        floatingActionButton: FloatingActionButton(
          child: IconButton(
            icon: Icon(Icons.threesixty),
            onPressed: () {
              setState(() {
                //NEW CODE: Currently selected theme toggles when FAB is pressed
                currentTheme == APP_THEME.DARK
                    ? currentTheme = APP_THEME.LIGHT
                    : currentTheme = APP_THEME.DARK;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget buildAppBarWidget() {
    return AppBar(
      leading: Icon(
        Icons.arrow_back,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.star_border),
          onPressed: () {
            print("Contact is starred");
          },
        ),
      ],
    );
  }

  // main body
  Widget buildBodyWidget() {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                "https://github.com/Saketthenuan/Saketthenuan.github.io/blob/main/Profile%20(1)-min.jpg?raw=true",
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Saket Thenua",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: profileActionItems(),
            ),
            Divider(
              color: Colors.grey,
            ),
            mobilePhoneListTile(),
            otherPhoneListTile(),
            Divider(
              color: Colors.grey,
            ),
            emailListTile(),
            Divider(
              color: Colors.grey,
            ),
            addressListTile(),
          ],
        ),
      ],
    );
  }

  //profile action
  Widget profileActionItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildCallButton(),
        buildTextButton(),
        buildVideoCallButton(),
        buildEmailButton(),
        buildDirectionsButton(),
        buildPayButton(),
      ],
    );
  }

  Widget buildCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.call,
          ),
          onPressed: () {},
        ),
        Text("Call"),
      ],
    );
  }

  Widget buildTextButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.message,
          ),
          onPressed: () {},
        ),
        Text("Text"),
      ],
    );
  }

  Widget buildVideoCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.video_call,
          ),
          onPressed: () {},
        ),
        Text("Video"),
      ],
    );
  }

  Widget buildEmailButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.email,
          ),
          onPressed: () {},
        ),
        Text("Email"),
      ],
    );
  }

  Widget buildDirectionsButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.directions,
          ),
          onPressed: () {},
        ),
        Text("Directions"),
      ],
    );
  }

  Widget buildPayButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.attach_money,
          ),
          onPressed: () {},
        ),
        Text("Pay"),
      ],
    );
  }

  Widget mobilePhoneListTile() {
    return ListTile(
      leading: Icon(
        Icons.call,
        color: Colors.grey,
      ),
      title: Text("+91 7500-399-754"),
      subtitle: Text("mobile"),
      trailing: IconButton(
        icon: Icon(
          Icons.message,
        ),
        onPressed: () {},
      ),
    );
  }

  //Building phone number component
  Widget otherPhoneListTile() {
    return ListTile(
      leading: Icon(
        Icons.call,
        color: Colors.grey,
      ),
      title: Text("+91 8433-414-349"),
      subtitle: Text("other"),
      trailing: IconButton(
        icon: Icon(
          Icons.message,
        ),
        onPressed: () {},
      ),
    );
  }

  //Building email address list tile
  Widget emailListTile() {
    return ListTile(
      leading: Icon(
        Icons.email,
        color: Colors.grey,
      ),
      title: Text("saketthenuan8045@gmail.com"),
      subtitle: Text("work"),
    );
  }

  //Building address widget
  Widget addressListTile() {
    return ListTile(
      leading: Icon(
        Icons.location_on,
        color: Colors.grey,
      ),
      title: Text("451 A,East view LPU"),
      subtitle: Text("Work"),
      trailing: IconButton(
        icon: Icon(
          Icons.directions,
        ),
        onPressed: () {},
      ),
    );
  }
}
