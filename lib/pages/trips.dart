import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:traveller/tabs/fav_trips.dart';
import 'package:traveller/tabs/mytrips.dart';
import 'package:traveller/tabs/whishlist.dart';
import 'package:traveller/widgets/appbar.dart';


class Trips extends StatefulWidget {
  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar call here
      appBar: header(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: TabBar(
                      controller: _tabController,
                      labelPadding: EdgeInsets.symmetric(horizontal: 25),
                      indicatorColor: Color(0xfff3f4f9),
                      indicator: PointTabIndicator(
                        position: PointTabIndicatorPosition.bottom,
                        insets: EdgeInsets.only(bottom: 3),
                        color: Colors.red,
                      ),
                      indicatorWeight: 1.0,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            'My Trips',
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Ubuntu-Regular'),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Favorite Trips',
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Ubuntu-Regular'),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Wishlist',
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Ubuntu-Regular'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'On-Going',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Ubuntu-Regular',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Up-Coming',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Ubuntu-Regular',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Ubuntu-Regular',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          MyTrips(),
                          FavoriteTrips(),
                          Whishlist(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Trips',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Ubuntu-Regular',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
