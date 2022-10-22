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

void taskFirst() {
  List<int> massif = List.generate(100, (int index) => index, growable: false);
  massif[0] = 300;
  for (int i = 0; i < massif.length; ++i) {
    massif[i + 1] = massif[i] - 3;
    if (i == 98) {
      break;
    }
  }
  print("Коллекция: $massif");
}

void taskSecond() {
  List<int> massif1 = List.generate(100, (int index) => index, growable: false);
  massif1[0] = 1;
  for (int i = 0; i < massif1.length; ++i) {
    massif1[i + 1] = massif1[i] + 2;
    if (i == 98) {
      break;
    }
  }
  print("Коллекция: $massif1");
}

void taskThird() {
  stdout.write(
      "Введите n, равное количеству столбцов и строк квадратной матрицы: ");
  try {
    int n = int.parse(stdin.readLineSync()!);
    int row = n;
    int col = n;

    List matrix = List.generate(row, (_) => List.filled(col, 0));

    for (int i = 0; i < row; ++i) {
      matrix[i][0] = 1;
      matrix[0][i] = 1;
    }
    for (int i = 1; i < row; ++i) {
      for (int j = 1; j < col; ++j) {
        matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1];
      }
    }
    for (int i = 0; i < matrix.length; ++i) {
      print(matrix[i]);
    }
  } catch (e) {
    print("Введены некорректные данные. Завершение.");
  }
}

List temperature = List.generate(12, (_) => List.filled(30, 0));
List middleTemperature = List.filled(12, 0);
var random = Random();

void taskFourth() {
  for (int i = 0; i < temperature.length; ++i) {
    for (int j = 0; j < 30; ++j) {
      if (i == 0 || i == 1 || i == 2) {
        temperature[i][j] = (random.nextInt(30) * -1);
      }
      if (i == 3 || i == 4) {
        temperature[i][j] = (random.nextInt(17));
      }
      if (i == 5 || i == 6 || i == 7) {
        temperature[i][j] = (random.nextInt(30) + 10);
      }
      if (i == 8 || i == 9) {
        temperature[i][j] = (random.nextInt(15) + 3);
      }
      if (((i == 10) || (i == 11))) {
        temperature[i][j] = (random.nextInt(30) * -1);
      }
    }
  }
  
  
  for (int i = 0; i < 12; ++i) {
    stdout.write("Температура в ${i + 1} месяце: ");
    print(temperature[i]);
  }
  stdout.write("Средние температуры (по месяцам): ");
  fMiddle(temperature);
    stdout.write(middleTemperature);
    print("\n");
}

List fMiddle (temperature) {
  int summa = 0;
  int a = 0;
  for (int i = 0; i < temperature.length; ++i) {
    for (int j = 0; j < temperature.length; ++j) {
      int b = temperature[i][j];
      summa += b;
    }
    a = summa ~/ 30;
    middleTemperature[i] = a;
    summa = 0;
  } 
  return middleTemperature;
} 

void taskFifth() {
  print("Средние температуры:");
  Map mapTemperature = {
    "Январь": List.generate(30, (_) => random.nextInt(30) * -1),
    "Февраль": List.generate(30, (_) => random.nextInt(30) * -1),
    "Март": List.generate(30, (_) => random.nextInt(30) * -1),
    "Апрель": List.generate(30, (_) => random.nextInt(17)),
    "Май": List.generate(30, (_) => random.nextInt(17)),
    "Июнь": List.generate(30, (_) => random.nextInt(30)),
    "Июль": List.generate(30, (_) => random.nextInt(30)),
    "Август": List.generate(30, (_) => random.nextInt(30)),
    "Сентябрь": List.generate(30, (_) => random.nextInt(15) + 3),
    "Октябрь": List.generate(30, (_) => random.nextInt(15) + 3),
    "Ноябрь": List.generate(30, (_) => random.nextInt(30) * -1),
    "Декабрь": List.generate(30, (_) => random.nextInt(30) * -1)
  };
  fHelpness(mapTemperature);
}


Map fHelpness (mapTemperature) {
  Map middleTemp = {
    "Январь": 0,
    "Февраль": 0,
    "Март": 0,
    "Апрель": 0,
    "Май": 0,
    "Июнь": 0,
    "Июль": 0,
    "Август": 0,
    "Сентябрь": 0,
    "Октябрь": 0,
    "Ноябрь": 0,
    "Декабрь": 0
  };
  
  for (var key in middleTemp.keys) {
    double summa1 = 0;
    for (int i = 0; i < 30; ++i) {
      summa1 += mapTemperature[key]![i];
    }
    middleTemp[key] = summa1 ~/ 30;
  }
  for (var value1 in middleTemp.entries) {
    print ("${value1.key} - ${value1.value}");
  }
  return middleTemp;
}
