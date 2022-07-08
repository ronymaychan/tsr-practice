read -p "Enter your Employee ID : " empid
read -p "Enter your token : " token
host=3.6.235.187
app=JenkinsTrigger
service=key
utility=git
out="wrong credentials"
userName=$(curl http://$host:8080/$app/api/$service/$utility/userName/$empid/$token)
if [ "$userName" == "$out" ]
then
echo "====================[ NOTICE ]======================"
echo "Either entered Employee ID or token is incorrect"
echo "Contact admin for support"
echo "===================================================="
sleep 10s
else
password=$(curl http://$host:8080/$app/api/$service/$utility/password/$empid/$token)
if [ "$password" == "$out" ]
then
echo "====================[ NOTICE ]======================"
echo "Either entered Employee ID or token is incorrect"
echo "Contact admin for support"
echo "===================================================="
sleep 10s
else
curl http://$host:8080/$app/api/employee/starttest/$empid
caseStudy=$(curl http://$host:8080/$app/api/$service/getcasestudy/$empid)
cmdkey /generic:git:https://git-codecommit.us-east-1.amazonaws.com /user:$userName /pass:$password
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/$caseStudy-$token
echo "====================[ NOTICE ]======================"
echo "        Cloned your repository successfully"
echo "===================================================="
sleep 20s
fi
fi