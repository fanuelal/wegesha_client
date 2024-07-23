import 'package:flutter/material.dart';
import 'package:wegesha_client/model/hcp.dart';

import '../screens/detail.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key,
      required this.size,
      required this.name,
      required this.filedStudy,
      required this.distance,
      required this.rate,
      required this.hcp,
      required this.imageUrl});
  final String name;
  final double rate;
  final HCP hcp;
  final String filedStudy;
  final String distance;
  final Size size;
  final imageUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Detail(hcp: hcp, id: '',)));
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffE5E7EB),
              ),
              borderRadius: BorderRadius.circular(11.13),
              color: Colors.transparent),
          child: Row(
            children: [
              SizedBox(width: 10),
              SizedBox(height: 10),
              Container(
                width: 150,
                height: size.height * 0.17,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.13),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.3,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    filedStudy,
                    style: TextStyle(
                      color: const Color(0xffA1A8B0),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 150, // Set width as needed
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Color.fromARGB(255, 17, 122, 112),
                        ),
                        Text(
                          rate.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 17, 122, 112)),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.location_on_rounded,
                          size: 20,
                          color: const Color(0xffA1A8B0),
                        ),
                        Text(
                          distance,
                          style: TextStyle(
                            color: const Color(0xffA1A8B0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
