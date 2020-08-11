import 'dart:io';

enum OperatorType { ADDITION, SUBTRACTION, MULTIPLICATION, DIVISION, ERROR }

void main() {
  do {
    start();
  } while (checkStart());
}

bool checkStart() {
  print("Press Any Key to start again, A to Exit");
  var value = stdin.readLineSync();
  if (value == "A" || value == "a") {
    return false;
  }
  return true;
}

void start() {
  print("First Number");
  var firstNumber = readFromConsole();
  print("Second Number");
  var secondNumber = readFromConsole();

  print("Result : ${calculate(firstNumber, secondNumber)}");
}

double readFromConsole() {
  return double.parse(stdin.readLineSync());
}

int chooseOperation() {
  print("Choose one of the operations below :");
  print("[1] : Addition");
  print("[2] : Substraction");
  print("[3] : Multiple");
  print("[4] : Divide");

  return int.parse(stdin.readLineSync());
}

OperatorType defineOperatorType() {
  OperatorType operatorType;
  switch (chooseOperation()) {
    case 1:
      operatorType = OperatorType.ADDITION;
      break;
    case 2:
      operatorType = OperatorType.SUBTRACTION;
      break;
    case 3:
      operatorType = OperatorType.MULTIPLICATION;
      break;
    case 4:
      operatorType = OperatorType.DIVISION;
      break;
    default:
      operatorType = OperatorType.ERROR;
      break;
  }
  return operatorType;
}

double calculate(var firstNumber, var secondNumber) {
  var result;
  switch (defineOperatorType()) {
    case OperatorType.ADDITION:
      result = firstNumber + secondNumber;
      break;
    case OperatorType.SUBTRACTION:
      result = firstNumber - secondNumber;
      break;
    case OperatorType.MULTIPLICATION:
      result = firstNumber * secondNumber;
      break;
    case OperatorType.DIVISION:
      {
        if (secondNumber == 0)
          throw new IntegerDivisionByZeroException();
        else
          result = firstNumber / secondNumber;
        break;
      }
    case OperatorType.ERROR:
      throw new Exception("Operation Exception");
  }

  return result;
}
