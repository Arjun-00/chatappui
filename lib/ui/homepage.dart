import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import '../model/messages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController controllerT= TextEditingController();
  List<Messages> chatData = [
    Messages(
        message: "hai",
        date: DateTime.now(),
        isSendByMe:true,
    ),
    Messages(
      message: "how are you..",
      date: DateTime.now(),
      isSendByMe:false,
    ),
    Messages(
      message: "dhfsvg  fghpjuis fdyh",
      date: DateTime.now(),
      isSendByMe:true,
    ),
    Messages(
      message: "rghfdyhugf yidtgfsy feswrewsrf",
      date: DateTime.now(),
      isSendByMe:false,
    ),
    Messages(
      message: "kxghzfoidgs iyhpdyhs iyupweo",
      date: DateTime.now(),
      isSendByMe:true,
    ),
    Messages(
      message: "dhfsvg  fghpjuis fdyh",
      date: DateTime.now(),
      isSendByMe:true,
    ),
    Messages(
      message: "dhfsvg  fghpjuis fdyh",
      date: DateTime.now(),
      isSendByMe:true,
    ),
    Messages(
      message: "dhfsvg  fghpjuis fdyh",
      date: DateTime.now(),
      isSendByMe:true,
    ),
    Messages(
      message: "dhfsvg  fghpjuis fdyh oshigb",
      date: DateTime.now(),
      isSendByMe:true,
    ),
    Messages(
      message: "dhfsvg  fghpjuis fdyh iuidgfspighfuh iudgfuias vlhjbgxzgf sidegf asyudfgpoasy",
      date: DateTime.now(),
      isSendByMe:false,
    ),
    Messages(
      message: "dhfsvg  fghpjuis fdyh yiuwoyrtgfaueisgfuisg",
      date: DateTime.now(),
      isSendByMe:false,
    ),
    Messages(
      message: "dhfsvg  fghpjuis fdyh oiugfapigdspohgudhshoiho[ih",
      date: DateTime.now(),
      isSendByMe:true,
    ),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatFree"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade400,
        child: Column(
          children: [
            Expanded(child: GroupedListView<Messages,DateTime>(
              padding: const EdgeInsets.all(10),
              reverse: true,
              order: GroupedListOrder.DESC,
              elements: chatData,
              groupBy: (chatData)=> DateTime(
                chatData.date!.year,
                chatData.date!.month,
                chatData.date!.day,
              ),
              groupHeaderBuilder: (Messages message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(DateFormat.yMMMd().format(message.date!),
                      style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context,Messages message) =>
                 Align(
                   alignment: message.isSendByMe == true ? Alignment.centerRight:Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.only(bottom: 5.0),
                     child: BubbleSpecialThree(
                       text: message.message.toString(),
                       color:  message.isSendByMe == true ?Colors.green : Colors.black45,
                       tail: true,
                       isSender: message.isSendByMe!,
                       textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                     ),
                   ),
                 ),
            ),
            ),
            bottomBar()
        ]
        ),
      ),
    );
  }

  Widget bottomBar(){
    return Container(
      height: 60,
      color: Colors.green,
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: "Type your message here...."
              ),
              controller: controllerT,

            ),
          ),
          Container(
          width: 50,
            height: 50,
            padding: const EdgeInsets.all(5),
            child: ClipOval(
              child: Material(
                color: Colors.blue, // Button color
                child: InkWell(
                  splashColor: Colors.red, // Splash color
                  onTap: () {
                   Messages messag = Messages(message: controllerT.text, date: DateTime.now(), isSendByMe: true);
                    setState(() {
                      chatData.add(messag);
                      controllerT.clear();
                    });
                  },
                  child: const SizedBox(width: 20, height: 20, child: Icon(Icons.send)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
