#!/bin/bash

## Uso:
## Correr el script pasandole como primer parametro el archivo NM de entrada y
## como segundo parametro donde se escribira la salida.
##
## Ej: ./ej2.sh NM003466_RF2.fas report_RF2.txt


## Evaluados todos los RF el que mas resultados tira es el RF 2
## por lo tanto ese es el RF correcto.

blastp -query $1 -db swissprot -out $2
