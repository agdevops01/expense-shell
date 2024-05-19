HEADING Installing Nginx
dnf install nginx -y

HEADING Copy expense config file
cp expense.conf /etc/nginx/default.d/expense.conf

HEADING clean old content
rm -rf /usr/share/nginx/html/*

HEADING download frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

cd /usr/share/nginx/html

HEADING extract content
unzip /tmp/frontend.zip

HEADING restart servic
systemctl restart nginx
systemctl enable nginx

