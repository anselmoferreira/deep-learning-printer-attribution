function sendmail2me(message)

myaddress = 'anselmocbferreira82@gmail.com';
mypassword = 'Gx+F6=y3x.bmw9';

setpref('Internet','E_mail',myaddress);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username',myaddress);
setpref('Internet','SMTP_Password',mypassword);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', ...
                  'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

sendmail(myaddress, 'Data-Driven Approach to Laser Printer Attribution Source Code', message);
end
