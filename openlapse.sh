DIRECTORY=""
NAME=""
DELAY=0
loopnum=0
args=("$@")
for i in $@
do
    if [[ $i == "-h" ]]; then
        echo -e "About:\n   OpenLapse is a shell script designed to clone chronolapse on Linux/BSD systems.\n\nChronolapse?\n   Chronolapse is... https://www.chronolapse.com/index.html visit it.\n"
        echo -e "Usage:\n   openlapse -n FILENAME -f DIRECTORY -d DELAY\n    -h is for help.\n    use CTRL+C to exit the app.\n"
        echo -e "Explanation:\n   -n FILENAME: quite self explanatory\n   -f DIRECTORY: quite self explanatory\n   -d DELAY: delay between screenshots\n"
        echo -e "Send complaints, improvements, suggestions, anything to: dramst8@protonmail.com\n"
        break
    fi
    if [[ $i == "-f" ]]; then
        DIRECTORY=${args[loopnum+1]}
    fi
    if [[ $i == "-n" ]]; then
        NAME=${args[loopnum+1]}
    fi
    if [[ $i == "-d" ]]; then
        DELAY=${args[loopnum+1]}
    fi
    ((++loopnum))
done
if [[ "${DIRECTORY: -1}" != "/" && $DIRECTORY != "" ]]; then
    DIRECTORY+="/"
fi
if [[ "$NAME" != *".png"*  || "$NAME" != *".PNG"* ]]; then
    NAME+=".png"
fi
FULL=$DIRECTORY$NAME
while true
do
    sleep $DELAY
    scrot $FULL
done
