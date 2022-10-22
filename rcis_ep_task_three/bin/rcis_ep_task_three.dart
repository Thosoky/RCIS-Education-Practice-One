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
      default:
        print("Невозможный номер.");
    }
  } catch (e) {
    print("Неверные данные.");
  }
}

void taskFirst() {}

void taskSecond() {
  try {
  File f = File('nums.txt');

  dynamic values = (f.readAsStringSync());
  List<String> stringNums = values.split(" ");
  List<int> nums = stringNums.map(int.parse).toList();
  print(nums);
  for (int i = 0; i < nums.length; ++i) {
    if (nums[i] % 2 == 0) {
      nums.remove(nums[i]);
    }
  }
  print(nums);

  String data = nums.toString();
  data = data.replaceAll(",", "");
  data = data.replaceAll("[", "");
  data = data.replaceAll("]", "");
  print(data);

  f.writeAsStringSync(data);
  } catch (e) {
    print("Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.");
  }
}
//1 6 35 22 13 87 5 6 67 10 78 42 7 7 7 14

void taskThird() {
  try {
  File f = File('area.txt'); 

  dynamic values = (f.readAsStringSync());
  List<String> stringHeight = values.split(",");
  List<int> height = stringHeight.map(int.parse).toList();

  int left = 0;
  int right = height.length - 1;
  int max = 0;

  while (left != right) {
    int distance = (left - right).abs();
    int area = 0;
    if (height[left] < height[right]) {
      area = height[left] * distance;
      left++;
    } else {
      area = height[right] * distance;
      right--;
    }

    if (area > max) {
      max = area;
    }
  }
  print(max);
  } catch (e) {
    print("Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.");
  }
}