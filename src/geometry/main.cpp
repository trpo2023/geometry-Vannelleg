#include "../libgeometry/intersection.h"
#include "../libgeometry/parser.h"
#include "../libgeometry/perimeter_and_area.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>

int main()
{
  std::cout << "\n-------Welcome to program-------\n"
            << "\n----Please, input the shape-----\n"
            << "\n---Example: circle(0 0.0, 1.5)--\n"
            << "\n-------To exit, input 'q'-------\n"
            << "\n---Second circle: (0 0, 2.8)----\n";
  char string[128];
  bool if_intersect;
  point a[2] = {10, 10, 1.5, 0, 0, 2.8};
  do
  {
    if_intersect = 1;
    for (int j = 1; j <= 2; j++)
      if (intersect(a) == 1)
      {
        if (if_intersect)
        {
          printf("\n intersects:");
          if_intersect = 0;
        }
        printf("\n  %d. circle\n", j);
      }
    std::cin.getline(string, 128);
    if ((strstr(string, "circle(") != NULL))
    {
      double rad, x, y;
      cheking_the_input(string);
      sscanf(string, "circle(%lf %lf, %lf)", &a[0].x, &a[0].y, &a[0].rad);
      sscanf(string, "circle(%lf %lf, %lf)", &x, &y, &rad);
      printf("Perimetr: %.3f, Area: %.3f\n", perimeter(rad), area(rad));
    }
  } while (strcmp(string, "q"));

  return 0;
}
