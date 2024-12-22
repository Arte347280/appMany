import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Taskconteiner extends StatefulWidget {
  Taskconteiner({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.delet,
    required this.edit,
    required this.tipe,
  });

  String title;
  String description;
  String tipe;
  String date;
  Function delet;
  Function edit;

  @override
  State<Taskconteiner> createState() => _TaskcontenerState();
}

class _TaskcontenerState extends State<Taskconteiner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: widget.tipe == 'by' ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  widget.delet();
                },
                icon: Icon(Icons.delete),
                color: Colors.black,
              )
            ],
          ),
          Row(
            children: [
              Text(
                widget.description,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  final String textToShare =
                      '${widget.date} - этого числа, Доход или Расход за: ${widget.description}: ${widget.title}₽';
                  Share.share(textToShare);
                },
                icon: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                widget.date,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  widget.edit();
                },
                icon: Icon(Icons.edit),
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
