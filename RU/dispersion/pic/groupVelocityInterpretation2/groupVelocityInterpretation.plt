set terminal postscript eps size 4,0.6 enhanced color font 'Helvetica,14'
# set terminal pngcairo  transparent enhanced font "arial,14" fontscale 1.0 size 1000, 200 

# set title "c < C" offset 0,-1

set xlabel "x - Ct, (c < C)" offset 0,0.4
set x2label ""
set ylabel "u(x,t)"
set y2label ""

set xrange [ 0 : 2*pi ] noreverse nowriteback
#set x2range [ * : * ] noreverse writeback
set yrange [ -2 : 2 ] noreverse writeback
#set y2range [ * : * ] noreverse writeback
#set zrange [ * : * ] noreverse writeback
#set cbrange [ * : * ] noreverse writeback
#set rrange [ * : * ] noreverse writeback

set samples 500

unset xtics
unset ytics

c_p = 1
c_g = 2
k = 10
dk = 1

do for [t=0:360] {
  outfile = sprintf('fig.%g.eps',t)
  set output outfile
  plot \
  2*cos(dk*(x - c_g*pi*t/180)) notitle linewidth 5 linecolor rgb 'red' dashtype 3, \
  - 2*cos(dk*(x - c_g*pi*t/180)) notitle linewidth 5 linecolor rgb 'green' dashtype 3, \
  2*cos(dk*(x - c_g*pi*t/180))*cos(k*(x - c_p*pi*t/180)) notitle linewidth 2.5 linecolor rgb 'blue'
}

pause -1
