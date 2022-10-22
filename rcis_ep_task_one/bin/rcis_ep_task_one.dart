import 'dart:io';
import 'dart:math';

void main() {
  stdout.write("Введите номер задания (1-5): ");
  try {
    switch (int.parse(stdin.readLineSync()!)) {
      case 1:
        taskFirst();
        break;
      case 2:
        taskSecond();
        break;
      case 3:
        taskThird();
        break;
      case 4:
        taskFourth();
        break;
      case 5:
        taskFifth();
        break;
      default:
        print("Невозможный номер.");
    }
  } catch (e) {
    print("Неверные данные.");
  }
}

List<int> massif = List.filled(10, 0);
void taskFirst() {
  functionRandom();
  stdout.write("Полученный массив: ");
  for (int i = 0; i < massif.length; ++i) {
    stdout.write("${massif[i]} ");
  }
  print(" ");
  int min = massif[0];
  int a = 0;
  for (int i = 0; i < massif.length; ++i) {
    if (min > massif[i]) {
      min = massif[i];
      a = i;
    }
  }
  stdout.write("Индекс минимального элемента: $a");
}

void functionRandom() {
  for (int i = 0; i < massif.length; ++i) {
    massif[i] = (Random().nextInt(11));
  }
}

void taskSecond() {
  int multi = 1;
  int summa = 0;
  print(
      "Вводимые числа будут добавляться в список. Чтобы закончить, введите ноль.");

  int entered = 1;
  List<int> massif = [];

  try {
    while (entered != 0) {
      entered = int.parse(stdin.readLineSync()!);
      if (entered == 0) {
        break;
      }
      massif.add(entered);
    }

    for (int i = 0; i < massif.length; ++i) {
      multi = multi * massif[i];
      summa = summa + massif[i];
    }
    if (massif[0] == 0) {
      multi = 0;
    }
    print("Ваш список: $massif");
    print("Сумма чисел Вашего списка = $summa");
    print("Произведение чисел Вашего списка = $multi");
    print("Среднее значение элементов = ${summa / massif.length}");
  } catch (e) {
    print("Введены некорректные данные. Завершение.");
  }
}

void taskThird() {
  print(
      "Вводимые элементы будут добавляться в список. Чтобы закончить, введите пустую строку.");

  dynamic entered = 1;
  String end = "";
  List massif = [];
  int a = 0;
  int b = 0;
  int lengthWord = 0;

  while (entered != end) {
    entered = stdin.readLineSync()!;
    if (entered == end) {
      break;
    }
    massif.add(entered);
  }
  int min = massif[0].length;
  int max = massif[0].length;

  for (int i = 0; i < massif.length; ++i) {
    lengthWord = massif[i].length;
    if (min > lengthWord) {
      min = lengthWord;
      a = i;
    }
    if (max < lengthWord) {
      max = lengthWord;
      b = i;
    }
  }
  print("Ваш список: $massif ");
  print("Самый короткий элемент: ${massif[a]}");
  print("Самый длинный элемент: ${massif[b]}");
}

List<int> massif1 = List.filled(10, 0);
void taskFourth() {
  int top;
  int bottom;

  try {
    print("Введите начало диапазона:");
    top = int.parse(stdin.readLineSync()!);
    print("Введите конец диапазона:");
    bottom = int.parse(stdin.readLineSync()!);
    functionRandom1(top, bottom);
    print("Полученный массив: ");
    for (int n in massif1) {
      stdout.write("$n ");
    }
  } catch (e) {
    print("Введены некорректные данные. Завершение.");
  }
}

void functionRandom1(int top, int bottom) {
  for (int i = 0; i < massif1.length; ++i) {
    massif1[i] = (Random().nextInt(bottom - top) + top);
  }
}

void taskFifth() {
  print(
      "Введите строку. После каждого слова ставьте пробел (да, даже после последнего).");
  String entered = stdin.readLineSync()!;
  print('Ваша строка: "Start ${entered}End"');
  stdout.write("Количество слов в Вашей строке: ");
  print(' '.allMatches(entered).length);
}