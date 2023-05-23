void main() {
  // PRIMITIVE DATATYPES
  bool boolVar = true;
  int intVar = 10;
  double doubleVar = 4.7;
  print('PRIMITIVE DATATYPES');
  print(' boolVar: $boolVar \n intVar: $intVar \n doubleVar: $doubleVar');

  //COMPLEX DATATYPES
  String strVar = 'text';
  List lsVar = [1, 2, 3];
  Map mapVar = {'key': 'val'};
  print('COMPLEX DATATYPES');
  print(' strVar: $strVar \n lsVar: $lsVar \n mapVar: $mapVar');

  // Dynamic variable: when we don't know which variable to use

  dynamic dynamicVariable = 4.5;
  print(dynamicVariable);

  // keywords

  late int
      lateInt; // here we are telling compiler that we take care of this lateInt later in the code
  lateInt = 1;

  print(lateInt);

  final int finalInt =
      2; // we won't be able to change this value later in the code
  const int constInt = 4; // constant value won't change during the runtime

  // Difference between const and final is explained briefly in const-and-final.txt

  print(finalInt);
  print(constInt);

  var varOut = 1; // var: it assigns values itself
  print(varOut);

  /**
   * dynamic: can change TYPE of the variable, & can change VALUE of the variable later in code.
   * var: can’t change TYPE of the variable, but can change the VALUE of the variable later in code.
   */

  var myVar = 'hello';
  dynamic myDynamicVar = 'hello';
  // myVar = 123; not possible
  myDynamicVar = 123; // possible

  print("myVar $myVar");
  print("myDynamicVar: $myDynamicVar");
}
