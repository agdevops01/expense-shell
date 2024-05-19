echo HEADING Installing Nginx
dnf install nginx -y

echo HEADING Copy expense config file
cp expense.conf /etc/nginx/default.d/expense.conf

echo HEADING clean old content
rm -rf /usr/share/nginx/html/*

echo HEADING download frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

cd /usr/share/nginx/html

echo HEADING extract content
unzip /tmp/frontend.zip

echo HEADING restart servic
systemctl restart nginx
systemctl enable nginx

