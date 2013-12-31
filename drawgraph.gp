#!/usr/bin/gnuplot


#	Script de GNUplot para dibujar una gráfica por países de ingresos y gastos en concepto de Propiedad Intelectual
#
#       Copyright 2013 Allan Psicobyte (psicobyte@gmail.com)
#
#       This program is free software: you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation, either version 3 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program.  If not, see <http://www.gnu.org/licenses/>.

reset

set term png size 2000,2000
set output "PrecioPropiedadIntelctual.png"
set datafile separator '	'

set title "Ingresos y pagos por uso de propiedad intelectual en millones de dólares (datos de http://wdi.worldbank.org/table/5.13# )"

set key autotitle columnheader left

set style data histograms
set style histogram rowstacked
set style fill transparent solid 0.25

set xzeroaxis

set xtics rotate by -270 rangelimited
set xtics font ", 10" 

set ytics 5000

set grid y
set grid xtics

plot "IntellectualPropertyCharges.csv" using 2 title 'Ingresos' linecolor rgb "#00FF00", \
     "IntellectualPropertyCharges.csv" using 0:($2+2000):2 with labels notitle rotate by 90, \
     "IntellectualPropertyCharges.csv" using 0:(-$3-2000):3 with labels notitle rotate by 90, \
     "IntellectualPropertyCharges.csv" using (-$3):xticlabel(1) title 'Pagos' linecolor rgb "#FF0000"
