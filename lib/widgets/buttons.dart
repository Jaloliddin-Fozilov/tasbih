import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Function() ozgartirgichPlus;
  final int yozuvSoniObshi;
  final Function() ozgartirgichMinus;

  Buttons(this.ozgartirgichPlus, this.yozuvSoniObshi, this.ozgartirgichMinus);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            shape: CircleBorder(),
            onPressed: ozgartirgichPlus,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                '+',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          MaterialButton(
            color: Colors.blueGrey,
            shape: CircleBorder(),
            onPressed: yozuvSoniObshi == 0 ? () {} : ozgartirgichMinus,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '-',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
