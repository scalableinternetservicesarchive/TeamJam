line_old='  socket: /var/run/mysqld/mysqld.sock'
line_new='  socket: /tmp/mysql.sock'
sed -i "" "s|$line_old|$line_new|g" config/database.yml
line_old='  password: oesophagus'
line_new='  password:'
sed -i "" "s|$line_old|$line_new|g" config/database.yml
