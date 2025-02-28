echo
echo "free memory   : $3 MiB ($(echo "scale=2; $3 * 100 / $1" | bc) %)"
echo
echo "used memory   : $5 MiB ($(echo "scale=2; $5 * 100 / $1" | bc) %)"
echo
echo '######################################################################'
echo

cpu=$(echo "100 - $(top -b -n 1 | grep 'Cpu(s)' | cut -d',' -f 4 | sed 's/id//')" | bc)

echo "CPU usage : $cpu %"
echo

echo '######################################################################'
echo
echo "top processes by cpu usage :"
echo
ps -eo pid,%cpu,comm --sort=-%cpu | head -n 6
echo

echo '######################################################################'
echo
echo "top processes by mem usage "
echo
ps -eo pid,%mem,comm --sort=-%mem | head -n 6
echo
