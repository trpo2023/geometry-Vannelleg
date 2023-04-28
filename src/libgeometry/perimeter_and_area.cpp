#include "../src/libgeometry/perimeter_and_area.h"
#include "../src/libgeometry/intersection.h"
#include <cstdlib>
#include <cstring>
#include <ctype.h>
#include <iostream>

const double Pi = 3.1415926535;

double perimeter(double value3) { return 2 * Pi * value3; }

double area(double value3) { return Pi * (value3 * value3); }
