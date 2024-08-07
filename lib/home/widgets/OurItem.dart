import 'package:flutter/material.dart';

class ouritem extends StatelessWidget {
  const ouritem(
      {super.key,
      required this.size,
      required this.title,
      required this.price,
      required this.press});

  final Size size;
  final String title;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          //
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(0, 250, 7, 7),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 107,
                child: Image.asset(
                  'assets/images/bear.jpg',
                  fit: BoxFit.fill,
                  scale: 5.5,
                ),
              ),
              ClipRRect(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 235, 235),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Text('$title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '$price',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('ขายแล้ว40,000ชิ้น',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 12),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
