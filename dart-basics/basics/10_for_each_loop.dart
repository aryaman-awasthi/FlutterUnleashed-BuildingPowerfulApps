// Used for every element inside a list/map/set
// dosen't have an index
// while iteration we can not manipulate it

void main() {
  List<int> numberList = [3, 4, 5, 6, 7, 5];
  List<int> secondList = [];

  // for (int i = 0; i < numberList.length; i++) {
  //   if (numberList[i] == 3) {
  //     secondList.add(numberList[i]);
  //   }
  //   print('list element: ${numberList[i]}');
  //   print('second list: $secondList');
  // }

  numberList.forEach((element) {
    element++;
    print(element);
    secondList.add(element);
  });

  print(numberList);
  print(secondList);
}
