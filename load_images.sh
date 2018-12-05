for i in `ls ./img`;
do
docker load -i ./img/$i
done
