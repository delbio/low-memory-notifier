command="bash $(pwd)/freespace.sh $1 $2 $3"
job="1 * * * * ${command}"
cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -
crontab -l
