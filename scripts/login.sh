#!/bin/bash
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
# __\MMMMMMMMM7\\MMMMMMMMM7\________
# ___\WWWWWWW7#R\\WWWWWWW7#R\_______
# ___________\7#R\_______\7#R\______
# ____________\7#R\_______\7#R\_____
# _____________\7#R\_______\7#R\____
# ______________\7#R\_______\7#R\___
# ________/7R\___\7#R\/7R\___\7#R\__
# ________|7##RMMM7#R||7##RMMM7#R|__
# __________\WWWWWWWW/__\WWWWWWWW/__

h=`date +%H`
if [ $h -lt 6 ]; then
  greetings='God natt'
elif [ $h -lt 10 ]; then
  greetings='God morgon'
elif [ $h -lt 12 ]; then
  greetings='God förmiddag'
elif [ $h -lt 13 ]; then
  greetings='God middag'
elif [ $h -lt 18 ]; then
  greetings='God eftermiddag'
elif [ $h -lt 21 ]; then
  greetings='God afton'
else
  greetings='God natt'
fi
printf '
__\\MMMMMMMMM7\\\\MMMMMMMMM7\\_________
___\\WWWWWWW7#R\\\\WWWWWWW7#R\\________
___________\\7#R\\_______\\7#R\\_______
____________\\7#R\\_______\\7#R\\______
_____________\\7#R\\_______\\7#R\\_____
______________\\7#R\\_______\\7#R\\____
________/7R\\___\\7#R\\/7R\\___\\7#R\\___
________|7##RMMM7#R||7##RMMM7#R|___
_________\\WWWWWWWW/__\\WWWWWWWW/____\n' | lolcat -h 0.4 -v 0.2

printf "      $greetings dr. Jönsson!"  | lolcat -h 0.4 -v 0.2
