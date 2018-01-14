<html>

<head>

<title>JSP JavaMail Example </title>

</head>

<body>

<%@ page import="java.util.*" %>

<%@ page import="javax.mail.*" %>

<%@ page import="javax.mail.internet.*" %>

<%@ page import="javax.activation.*" %>

<%

String host = "174.123.208.178";

String to = request.getParameter("rakdim@gmail.com");

String from = request.getParameter("hr@finacletech.com");

String subject = request.getParameter("Test MAil");

String messageText = request.getParameter("Hello");

boolean sessionDebug = false;

// Create some properties and get the default Session.

Properties props = System.getProperties();

props.put("mail.host", "mail.finacletech.com");

props.put("mail.transport.protocol", "mail.finacletech.com");

Session mailSession = Session.getDefaultInstance(props, null);

 

// Set debug on the Session

// Passing false will not echo debug info, and passing True will.

 

mailSession.setDebug(sessionDebug);

 

// Instantiate a new MimeMessage and fill it with the 

// required information.

 

Message msg = new MimeMessage(mailSession);

msg.setFrom(new InternetAddress(from));

InternetAddress[] address = {new InternetAddress(to)};

msg.setRecipients(Message.RecipientType.TO, address);

msg.setSubject(subject);

msg.setSentDate(new Date());

msg.setText(messageText);

 

// Hand the message to the default transport service

// for delivery.

 

Transport.send(msg);

out.println("Mail was sent to " + to);

out.println(" from " + from);

out.println(" using host " + host + ".");

%>

</table>

</body>

</html>