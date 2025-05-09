#include <stdio.h>

extern int getB(int, int);
extern int suma(int, int);
extern char strlen (char);
int dato = 1;
int num_bit = 0;
int resultado;

int main()
{
 
   printf("En biy %d del dato: %x es %d \n", 0, dato, getB(dato, num_bit));
   printf("El resultado de la suma de los dos numeros es: %d", resultado);
   printf("")
   return 0;
}