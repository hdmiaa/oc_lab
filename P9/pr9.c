#include <stdio.h>

extern int suma(int, int);
extern char strlen (int *);
extern char *strchr(char *, char);
extern int getBit(int, int);
int dato = 1;
int num_bit = 0;
int resultado;

int main()
{
 
   printf("En biy %d del dato: %x es %d \n", 0, dato, getBit(dato, num_bit));
   printf("El resultado de la suma de los dos numeros es: %d", resultado);
   printf("Buscar un caracter: ")
   return 0;
}