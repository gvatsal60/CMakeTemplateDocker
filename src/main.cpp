#include <iostream>

#include "addition.h"
#include "division.h"
#include "print_result.h"
#include "main.h"

int main(int argc, char const *argv[]) {
  float first_no, second_no, result_add, result_div;

  std::cout << "Enter first number\t";
  std::cin >> first_no;
  std::cout << "Enter second number\t";
  std::cin >> second_no;

  result_add = addition(first_no, second_no);
  result_div = division(first_no, second_no);

  print_result("Addition", result_add);
  print_result("Division", result_div);
  println("Hello World!!!");

  return 0;
}
