import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_visitors/provider/provider.dart';
import 'package:online_visitors/screens/list_of_department.dart';
import 'package:provider/provider.dart';

class VisitsArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2;
    return Consumer<BrainProvider>(
      builder: (context, brain, child) {
        return Container(
          padding: EdgeInsets.all(10),
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            children: List.generate(
              brain.dataLength,
              (index) {
                final getData = brain.data[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DepartmentScreen(),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(getData.image),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(getData.title),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_city_outlined,
                              ),
                              Text('4'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
