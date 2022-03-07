import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? onTap;
  final int notificationCount;

  const BadgeIcon({
    Key? key,
    this.onTap,
    required this.text,
    required this.iconData,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,height: 42,
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(iconData,color: Colors.white,),
                Text(text, overflow: TextOverflow.ellipsis),
              ],
            ),
            Visibility(visible:check_notifcaition(notificationCount),child:
            Positioned(
              top: 0,
              right: -4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                alignment: Alignment.center,
                child: Text('$notificationCount', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.0)),
              ),
            ))
          ],
        ),
      ),
    );
  }

  bool check_notifcaition(int notificationCount) {

    var _show=true;
    if(notificationCount==0)
      _show=false;

    return _show;

  }
}
