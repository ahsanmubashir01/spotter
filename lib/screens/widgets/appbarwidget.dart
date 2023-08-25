import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class appbar extends StatelessWidget {
  const appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        18,
        60,
        0,
        0,
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/icons/backarrow.svg'),
          SizedBox(
            width: 70,
          ),
          Text(
            'Matches',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 70,
          ),
          SvgPicture.asset(
            'assets/images/icons/gridview.svg',
            width: 50,
          ),
        ],
      ),
    );
  }
}