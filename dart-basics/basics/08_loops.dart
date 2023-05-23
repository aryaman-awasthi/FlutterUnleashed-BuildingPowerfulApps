// ENTRY CONTROLLED LOOPS

void main() {
  int number = 1;

  while (number < 100) {
    print('number $number.');
    number += 2;
  }

  // for loop implementation
  for (number = 1; number < 100; number += 2) {
    print('number $number.');
  }
}
