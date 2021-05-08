import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';
import 'package:tabebcom_flutter/pages/user_visits.dart';
import 'package:tabebcom_flutter/utils/theme.dart';
import '../../pages/specifications.dart';
import '../../widgets/my_drawer.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: Container(
        width: 250.0,
        child: MyDrawer(),
      ),
      body: ListView(
        children: [
          Center(
              widthFactor: 16.0,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 200.0,
                ),
              )),
          HomePageSliders(),
          Container(
            padding: EdgeInsets.all(16.0),
            child:

 OrientationBuilder(builder: (BuildContext context,Orientation orientaion){ 
   print('is portrait  ${orientaion == Orientation.portrait}');
        return        orientaion == Orientation.portrait ?

             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HomePageCard(
                  title: getTranslated(context,'book an appointmant with a doctor').toString(),
                  iconImage: 'assets/images/doctor.png',
                  page: Specifications(
                    title: getTranslated(context,'book an appointmant with a doctor').toString(),
                    isTeleMed: false,
                  ),
                ),
                HomePageCard(
                  title: getTranslated(context,'book an appointmant with a doctor online').toString(),
                  iconImage: 'assets/images/date.png',
                  page: Specifications(
                    title: getTranslated(context,'book an appointmant with a doctor online').toString() ,
                    isTeleMed: true,
                  ),
                ),
                HomePageCard(
                  title: getTranslated(context,'my visits record').toString(),
                  iconImage: 'assets/images/patient.png',
                  page: UserVisits(title: getTranslated(context,'my visits record').toString(),),
                ),
              ],
            ):Text('ddd');

 })
          ),
        ],
      ),
    );
  }
}

class HomePageCard extends StatelessWidget {
  final String title;
  final String iconImage;
  final Widget page;
  const HomePageCard({this.title, this.iconImage, this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hi this is 1st card');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return page;
        }));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Color(0xFF0ebcbb),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [
                  Expanded(
                      child://Icon(FontAwesome.user_md),
                       Image(
                        image: AssetImage(iconImage),
                        width: 45.0,
                      ),
                      flex: 4),
                  Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 14.0, color: Colors.white,fontFamily: myThemeData.textTheme.bodyText1.fontFamily),
                      ),
                      flex: 15)
                ],
              ),
            )),
      ),
    );
  }
}

class HomePageSliders extends StatelessWidget {
  final List swiperImages = [
    'assets/images/one.png',
    'assets/images/two.png',
    'assets/images/three.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 200.0,
      child: new Swiper(
        duration: 500,
        scrollDirection: Axis.horizontal,
        autoplayDisableOnInteraction: true,
        autoplay: true,
        itemHeight: 100.0,
        itemBuilder: (BuildContext context, int index) {
          return new ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                swiperImages[index],
                fit: BoxFit.fill,
              ));
        },
        itemCount: swiperImages.length,
        pagination: new SwiperPagination(),
      ),
    );
  }
}
