#include "../src/libgeometry/intersection.h"
#include "../src/libgeometry/perimeter_and_area.h"
#include <cmath>
#include <cstdlib>
#include <cstring>
#include <ctype.h>
#include <iostream>

int intersect(point a[]) {
  if (sqrt(powf(abs(a[0].x - a[1].x), 2) + powf(abs(a[0].y - a[1].y), 2)) <
      a[0].rad + a[1].rad) {
    return 1;
  }
  return 0;
}