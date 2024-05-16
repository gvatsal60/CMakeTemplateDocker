#include <cstdint>

#include "memlib.h"
#include "utils.h"

int main(int argc, char const *argv[]) {
  println("Hello World!!!");
  uint8_t *ptr = new uint8_t();
  MemClean(ptr);

  return 0;
}
