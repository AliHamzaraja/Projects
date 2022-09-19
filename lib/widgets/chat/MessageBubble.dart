import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.messages, this.isMe, this.username, {super.key});
  final String messages;
  final String username;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      mainAxisAlignment:
          !isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          width: 180,

          /// height: 50,
          decoration: BoxDecoration(
              color: !isMe ? Colors.green : Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: !isMe ? Radius.circular(12) : Radius.circular(0),
                  bottomLeft:
                      !isMe ? Radius.circular(0) : Radius.circular(12))),
          child: Column(
            children: [
              Text(
                username,
                style: TextStyle(
                    color: !isMe ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                messages,
                style: TextStyle(color: !isMe ? Colors.white : Colors.black),
                textAlign: !isMe ? TextAlign.start : TextAlign.end,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
