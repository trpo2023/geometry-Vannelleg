#include "../thirdparty/ctest.h"
#include "../libgeometry/intersection.h"
#include "../src/libgeometry/parser.h"
#include "../src/libgeometry/perimeter_and_area.h"

CTEST(ctest, CHECK_PERIMETER) {
  double r = 8.067;
  const double Pi = 3.1415926535;
  double expected = 2 * Pi * r;
  double result;
  result = perimeter(r);
  ASSERT_DBL_NEAR_TOL(expected, result, 1e-1);
}

CTEST(ctest, CHECK_AREA) {
  double r = 8.067;
  const double Pi = 3.1415926535;
  double expected = Pi * r * r;
  double result = area(r);
  ASSERT_DBL_NEAR_TOL(expected, result, 1e-1);
}

CTEST(ctest, CHECK_INTERSECTION) {
  point a[2] = {10, 10, 1.5, 0, 0, 1};
  double expected = 0;
  double result = intersect(a);
  ASSERT_EQUAL(expected, result);
}
