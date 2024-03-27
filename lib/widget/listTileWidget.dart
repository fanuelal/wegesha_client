import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3D9EBj_6BQZdXq0lbtCzwMMGB2XHrMDUom8e8tp1INJg2-FZ1woCOUWNbs7Xp-REUjqE&usqp=CAU',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(
                  'Dr.Rute',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Psyclogist",
                          style: TextStyle(
                            color: const Color(0xffA1A8B0),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Color.fromARGB(255, 17, 122, 112),
                            ),
                            Text(
                              "4.5",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 17, 122, 112)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 20,
                        color: const Color(0xffA1A8B0),
                      ),
                      Text(
                        "800 KM",
                        style: TextStyle(
                          color: const Color(0xffA1A8B0),
                        ),
                      )
                    ])
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
