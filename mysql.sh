source common.sh
rm -f /tmp/expense.log

HEADING Installing MySQL Server
dnf install mysql-server -y &>>/tmp/expense.log
STAT $?

HEADING Start Nginx Service
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log
STAT $?

HEADING Set Root Password
mysql_secure_installation --set-root-pass ExpenseApp@1
STAT $?
