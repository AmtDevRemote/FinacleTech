<?php
include("Mail.php");
/* mail setup recipients, subject etc */
$recipients = "rakdim@gmail.com";
$headers["From"] = "hr@finacletech.com";
$headers["To"] = "rakdim@gmail.com";
$headers["Subject"] = "User feedback";
$mailmsg = "Hello, This is a test.";
/* SMTP server name, port, user/passwd */
$smtpinfo["host"] = "174.123.208.178";
$smtpinfo["port"] = "25";
$smtpinfo["auth"] = true;
$smtpinfo["username"] = "hr@finacletech.com";
$smtpinfo["password"] = "finacle";
/* Create the mail object using the Mail::factory method */
$mail_object =& Mail::factory("smtp", $smtpinfo);
/* Ok send mail */
$mail_object->send($recipients, $headers, $mailmsg);
?>