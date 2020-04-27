import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_home_rental_app/SizeConfig.dart';
import 'package:flutter_home_rental_app/renttwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: RentOne(),
        );
      });
    });
  }
}

class RentOne extends StatefulWidget {
  @override
  _RentOneState createState() => _RentOneState();
}

class _RentOneState extends State<RentOne> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 3 * SizeConfig.widthMultiplier
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: 5 * SizeConfig.heightMultiplier
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.arrow_back_ios, color: Colors.black, size: 5 * SizeConfig.imageSizeMultiplier,),
                    Spacer(),
                    Icon(Icons.search, color: Colors.black, size: 5 * SizeConfig.imageSizeMultiplier,),
                    SizedBox(width: 5 * SizeConfig.widthMultiplier,),
                    Image.asset("assets/images/menu.png", height: 5 * SizeConfig.imageSizeMultiplier, width: 5 * SizeConfig.imageSizeMultiplier,)
                  ],
                ),
              ),
              Text('''Meeting
Place''', style: TextStyle(
                color: Colors.black,
                fontSize: 7 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.w700,
              ),),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _homeList("assets/images/rent1.jpg", "\$12", Colors.cyan),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RentTwo()),
                          );
                      },
                      child: _homeList("assets/images/rent2.jpg", "\$10", Colors.deepPurpleAccent),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                    _homeList("assets/images/rent1.jpg", "\$20", Colors.lightBlueAccent),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                    _homeList("assets/images/rent3.jpg", "\$15", Colors.red[300]),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }

  _homeList(String asset, String rate, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey[300])
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 3 * SizeConfig.widthMultiplier,
          vertical: 2 * SizeConfig.heightMultiplier
        ),
        child: Row(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(asset, fit: BoxFit.cover, height: 20 * SizeConfig.imageSizeMultiplier, width: 20 * SizeConfig.imageSizeMultiplier,),
                ),
                Positioned(
                  right: -5.0,
                  bottom: -5.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.white, size: 3 * SizeConfig.imageSizeMultiplier,),
                          SizedBox(width: 1 * SizeConfig.widthMultiplier,),
                          Text("12.5k", style: TextStyle(
                            color: Colors.white,
                            fontSize: 1.4 * SizeConfig.textMultiplier
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 3 * SizeConfig.widthMultiplier,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(rate, style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 2.2 * SizeConfig.textMultiplier
                ),),
                SizedBox(height: 0.3 * SizeConfig.heightMultiplier,),
                Text("Charming Villa, Apmt", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 1.8 * SizeConfig.textMultiplier
                ),),
                SizedBox(height: 0.3 * SizeConfig.heightMultiplier,),
                Row(
                  children: <Widget>[
                    Text("3200 sq.ft", style: TextStyle(
                        color: Colors.black,
                        fontSize: 2 * SizeConfig.textMultiplier
                    ),),
                    SizedBox(width: 3 * SizeConfig.widthMultiplier,),
                    Text("4BHK", style: TextStyle(
                        color: Colors.black,
                        fontSize: 2 * SizeConfig.textMultiplier
                    ),),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}