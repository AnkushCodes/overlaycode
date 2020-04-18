import 'package:flutter/material.dart';


class BuildToast extends StatefulWidget {

BuildToast({this.widget,this.offset}); 
final Widget widget;
final Offset offset;
  @override
  _BuildToastState createState() => _BuildToastState();
}

class _BuildToastState extends State<BuildToast> with SingleTickerProviderStateMixin {
  
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this
    ,duration: const Duration(milliseconds: 500));
  _animation = new Tween(begin:0.0,end:1.0).animate(
    CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.5)
    )..addListener(() {
      if(mounted){
        setState(() {
          
        });
      }
    })..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse().orCancel;
      }else if(status == AnimationStatus.dismissed )
      {
        _controller.forward().orCancel;
      }
    })
    );
     _controller.forward().orCancel;    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Positioned(child: IgnorePointer(
      child: Material(
        color: Colors.yellow,
        child: Opacity(opacity: _animation.value,
        child: widget.widget,
        ),
        
      ),
    ));
  }
}