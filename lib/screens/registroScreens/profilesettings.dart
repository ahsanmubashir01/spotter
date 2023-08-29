import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [ Padding(
        padding: const EdgeInsets.fromLTRB(
          18,
          60,
          0,
          0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/icons/backarrow.svg'),
            SizedBox(
              width: 50,
            ),
            InkWell(
              child: Text(
                '     Profile',
                style:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // onTap: (){Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Matches()),
              // );},
            ),
          ],
        ),
      ),],),
    );
  }
}
