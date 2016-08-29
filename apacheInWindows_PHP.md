Apachelounge.com, download the compiled(against Visual Studio?) apache in windows

How to install apache in windows
https://www.youtube.com/watch?v=17qhikHv5hY

Httpd -k install
Httpd-k uninstall

Update listen to another port different from 80, e.g 8081


c:\windows\system32\drivers\etc\hosts
Add 127.0.01 mydomain.com


Php setup
Refer video https://www.youtube.com/watch?v=6Y6lOHov3Bk
Php.net -> download -> windows binaries -> zip version

Copy php.ini-development into php.ini, modify    extension_dir="ext"
Set path environment vairable


Need to make sure the VC version should be the same for apache and php.
And make sure the X86 or x64 is used
Make sure Visual C++ Redistributable for Visual Studio 2015 is also installed


VC means Visual Studio Complier


Run httpd -k start as admin

<Directory />
    AllowOverride All
    Require all granted
</Directory>

MySQL
How to use the non-installer zipu
http://dev.mysql.com/doc/refman/5.7/en/windows-install-archive.html

mysqld.exe --initialize --console 
Must use "-console", otherwise no password will show
Ec)Nv2,5a:A3


Start server: mysqld --console
Connect: mysql -u root -p

Change user credentilas 
ALTER USER user IDENTIFIED BY 'auth_string';

From <http://dev.mysql.com/doc/refman/5.7/en/set-password.html> 

Root
Pass:123

Learn from here
http://www.w3schools.com/php/php_mysql_connect.asp

Enable 
extension=php_mysqli.dll