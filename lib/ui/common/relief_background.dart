import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relief/values/colors.dart';

class ReliefBackground extends StatelessWidget {
  final Widget child;

  const ReliefBackground({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  'assets/images/header_right.svg',
                  color: yellowIconColor,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topRight,
                  height: MediaQuery.of(context).size.height * 0.7,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'assets/images/footer_left.svg',
                    color: yellowIconColor,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SvgPicture.asset(
                    'assets/images/footer_right.svg',
                    color: yellowIconColor,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              )
            ],
          )),
      child
    ]);
  }
}
