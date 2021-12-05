#!/bin/bash
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
# _\MMMMMMMMM7\______\MMMMMMMMM7\________
# __\WWWWWWW7#R\______\WWWWWWW7#R\_______
# __________\7#R\_____________\7#R\______
# ___________\7#R\_____________\7#R\_____
# ____________\7#R\_____________\7#R\____
# _____________\7#R\_____________\7#R\___
# _______/7R\___\7#R\______/7R\___\7#R\__
# _______|7##RMMM7#R|______|7##RMMM7#R|__
# _________\WWWWWWWW/________\WWWWWWWW/__

printf '
_\\MMMMMMMMM7\\______\\MMMMMMMMM7\\________
__\\WWWWWWW7#R\\______\\WWWWWWW7#R\\_______
__________\\7#R\\_____________\\7#R\\______
___________\\7#R\\_____________\\7#R\\_____
____________\\7#R\\_____________\\7#R\\____
_____________\\7#R\\_____________\\7#R\\___
_______/7R\\___\\7#R\\______/7R\\___\\7#R\\__
_______|7##RMMM7#R|______|7##RMMM7#R|__
_________\\WWWWWWWW/________\\WWWWWWWW/__
       ' | lolcat -r -h 0.65 -v 0.4


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
printf "
       $greetings dr. Jönsson!" | lolcat
echo
