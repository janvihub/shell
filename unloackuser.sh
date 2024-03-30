#! /bin/bash
#user is exist or not and unlock the user
echo "Enter the username"
read user
echo "------------------USER RELEATED LIST---------------------"
echo "1.Check user is exit or not"
echo "2.Unlock the user"
echo "3.Create the user"
echo "4.delete the user"
echo "5.Change the password"
read no
case $no in
1)
  User=`id $user 2>&1 >> /dev/null  | wc -l`
  if [ $User -eq 0 ]
  then
  echo "user is exist"
  else
  echo "user is not Avialable"
  fi
;;
2)
  User=`id $user 2>&1 >> /dev/null  | wc -l`
  if [ $User -eq 0 ]
  then
  faillock --user $user --reset
  passwd -u $user
  echo "user $user is unlock. Kindy check"
  else
  echo "Mention user is not present kindly contac with your admin"
  fi
;;
3)
   useradd $user
   echo " user is created $user.Kindly check"
   sleep 5
   echo "Enter and set the passwd"
   read -s paswwd
   echo $paswwd | passwd $user --stdin

;;
4)
  User=`id $user 2>&1 >> /dev/null  | wc -l`
  if [ $User -eq 0 ]
  then
  userdel $user
  echo "user $user is delete"
  else
  echo "Mention user is not present kindly contac with your admin"
  fi
;;
5)
  User=`id $user 2>&1 >> /dev/null  | wc -l`
  if [ $User -eq 0 ]
  then
  echo "Enter the passwd"
  read -s paswwd
  echo $paswwd | passwd $user --stdin
  else
  echo "Mention user is not present kindly contac with your admin"
  fi
;;
*)
 echo "Chooes wrong option"
esac
