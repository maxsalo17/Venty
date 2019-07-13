import 'package:flutter/material.dart';

class Percent{

  Percent(this.context);
BuildContext context;
double fromPersentWidth(double percent){
     return MediaQuery.of(context).size.width * percent;
}
  
  double fromPersentHeight(double percent){
    return MediaQuery.of(context).size.height*percent;
  }

  double fromPersentWidthMax(double percent, double maxWidth){
    if(MediaQuery.of(context).size.width*percent > maxWidth){
      return maxWidth;
    }
    else return MediaQuery.of(context).size.width*percent;
  }

  double fromPersentHeightMax(double percent, double maxHeight){
    if(MediaQuery.of(context).size.width*percent > maxHeight){
      return maxHeight;
    }
    else return MediaQuery.of(context).size.width*percent;
  }
}


class Limiter{

   double maxLimit(double current, double max){
     if(current>max){
       current=max;
     }
     return current;
   }

   double minLimit(double current, double min){
     if(current< min){
       current=min;
     }
     return min;
   }

   double minMaxLimit(double current, double min, double max){
     if(current < min){
       current = min;
     }
     else if(current > max){
       current = max;
     }
     return current;
   }

}