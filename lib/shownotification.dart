
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlaycode/showblink.dart';

class ShowNotification{
  bool isVisible =false;

Future<void> showAnimWidget(BuildContext contextan,
WidgetBuilder externalBuilder,
Duration duration,
Offset postioned
) async {
if(isVisible) return;

isVisible = true;

OverlayState overlayState = Overlay.of(contextan);
OverlayEntry overlayEntry = new OverlayEntry(builder: (BuildContext context){
return BuildToast(widget:externalBuilder(context),offset:postioned);
});
 overlayState.insert(overlayEntry);

        await new Future.delayed(duration);

        overlayEntry.remove();

        isVisible = false;


}


void show(BuildContext context) async{
OverlayState overlayState = Overlay.of(context);
OverlayEntry overlayEntry = OverlayEntry(builder: widBuild);
overlayState.insert(overlayEntry);
await new Future.delayed(const Duration(seconds: 2));
overlayEntry.remove();
}

void showAnimation(BuildContext context) async{
OverlayState overlayState = Overlay.of(context);
OverlayEntry overlayEntry = OverlayEntry(builder: widBuild);
overlayState.insert(overlayEntry);
await new Future.delayed(const Duration(seconds: 2));
overlayEntry.remove();
}


Widget widBuild(BuildContext context){
  return new Positioned(
    top: 50.0,
    left: 50.0,
    child: 
  Material(
    
    color: Colors.orange,
    child: Text('This is Notification',style: TextStyle(color:Colors.purple),),

  ));
}
}