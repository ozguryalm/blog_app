import 'package:blog/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainLayoutView extends StatelessWidget {
  final Widget child;
  final FloatingActionButton? fab;
  final String? title;
  final Widget? leading;
  const MainLayoutView(
      {Key? key, required this.child, this.fab, this.title, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leading,
        title: Text(
          title ?? "",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.1.w),
        child: child,
      ),
      floatingActionButton: fab,
    );
  }
}
