import 'package:flutter/material.dart';
import 'package:safe_driving_app/models/history.dart';
import 'package:safe_driving_app/services/http_service.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late List<HistoryModel>? _historyModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    _historyModel = (await HttpService().tripDetails())!;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 40),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Save Drive',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900]),
            ),
            SizedBox(
              width: 10,
            ),
            Image(image: AssetImage('images/logo.png')),
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        _historyModel == null || _historyModel!.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
          itemCount: _historyModel!.length,
            itemBuilder: (context, index) {
                return Card(
                  elevation: 20,
                  margin: EdgeInsets.all(10),
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 10,
                            ),

                            Text(_historyModel![index].currentLocation)
                            // Text('${currentLocation}',style: TextStyle(fontSize: 10),)
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Icon(Icons.linear_scale_outlined,),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 10,
                            ),
                            Text(_historyModel![index].destinationLocation)
                            //Text('${destinationLocation}',style: TextStyle(fontSize: 20))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_historyModel![index].distance.toString())
                            //  Text('Distance: ${distance}',style: TextStyle(fontSize: 20))
                          ],
                        )
                      ])),
                );
              })
        // FutureBuilder(
        //    // future: service,
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {
        //       if (snapshot.hasData) {
        //         ListView.builder(
        //             itemCount: snapshot.data.length,
        //             itemBuilder: (BuildContext context, int index) {
        //               return Card(
        //                 elevation: 20,
        //                 margin: EdgeInsets.all(10),
        //                 child: Container(
        //                     padding: EdgeInsets.all(20),
        //                     child: Column(children: [
        //                       SizedBox(
        //                         height: 10,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Icon(Icons.location_on),
        //                           SizedBox(
        //                             width: 10,
        //                           ),
        //                           Text('aml1')
        //                           // Text('${currentLocation}',style: TextStyle(fontSize: 10),)
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       // Icon(Icons.linear_scale_outlined,),
        //                       Row(
        //                         children: [
        //                           Icon(Icons.location_on),
        //                           SizedBox(
        //                             width: 10,
        //                           ),
        //                           Text('aml')
        //                           //Text('${destinationLocation}',style: TextStyle(fontSize: 20))
        //                         ],
        //                       ),
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: [
        //                           Text('20')
        //                           //  Text('Distance: ${distance}',style: TextStyle(fontSize: 20))
        //                         ],
        //                       )
        //                     ])),
        //               );
        //             });
        //       } else {
        //         return Center(
        //           child: CircularProgressIndicator(),);}
        //       return Center(
        //         child: CircularProgressIndicator(),);
        //     }
        // ),

        // ListView.builder(itemBuilder: (context,index){return Container(
        //
        //   child: Column(
        //     children: [
        //       Row(
        //         children: [
        //           Icon(Icons.location_on),
        //           SizedBox(width: 10,),
        //          // Text('${currentLocation}',style: TextStyle(fontSize: 10),)
        //         ],
        //       ),
        //       // Icon(Icons.linear_scale_outlined,),
        //       Row(
        //         children: [
        //           Icon(Icons.location_on),
        //           SizedBox(width: 10,),
        //           //Text('${destinationLocation}',style: TextStyle(fontSize: 20))
        //         ],
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //
        //         //  Text('Distance: ${distance}',style: TextStyle(fontSize: 20))
        //         ],
        //       ),
        //     ],
        //   ),
        // );})
      ],
    );
  }
}
