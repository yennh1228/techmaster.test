import 'package:flutter/material.dart';
import 'main.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 40, right: 16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Thông báo",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 28)),
                Icon(
                  Icons.search,
                  size: 28,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Image.network(
                                "${notificationResponse.data![index].image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 20.0,
                                    width: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.network(
                                  "${notificationResponse.data![index].icon}",
                                  height: 16.0,
                                  width: 16.0,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${notificationResponse.data![index].message?.text}",
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              DateTime.fromMillisecondsSinceEpoch(
                                      notificationResponse
                                              .data![index].receivedAt! *
                                          1000)
                                  .toString(),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 8),
                            const Icon(Icons.more_horiz)
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemCount: notificationResponse.data!.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget message() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${notificationResponse.data![2].message?.text}",
            overflow: TextOverflow.clip,
          ),
          Text(DateTime.fromMillisecondsSinceEpoch(
                  notificationResponse.data![2].receivedAt!)
              .toString()),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }

  Widget avatar() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: 56,
            width: 56,
            child: Image.network(
              "${notificationResponse.data![2].image}",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  color: Colors.white,
                ),
              ),
              Image.network(
                "${notificationResponse.data![2].icon}",
                height: 16.0,
                width: 16.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
