import 'dart:math';

int randint(int lower, int upper) {
  return Random().nextInt((upper - lower)) + lower;
}
