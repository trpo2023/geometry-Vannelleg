#pragma once

typedef struct Point {
  double x;
  double y;
  double rad;
} point;

const int n = 3;
double perimeter(double value3);
double area(double value3);
void perimeter_and_area(char *s1, char *s2, char *s3);
double parsing_X(char *s1);
double parsing_Y(char *s1);
double parsing_Radius(char *s1);
