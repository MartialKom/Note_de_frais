package com.octest.forms;

import java.io.File;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Envoi {

	public static int main(String[] args) {
		
		String smtpServer = "127.0.0.1";
		String from = "admin@localserver.com";
		String to = "accounts@localserver.com";
		String objet = "Nouvelle Note de la SPC";
		String texte = "Vous avez recu une nouvelle Note de frais, Veuillez la consulter ici: http://localhost:8080/Projet2/ser1  "
				+ "Connectez vous grace à vos identifiants. Vous les avez oublié?? Contactez l'administrateur du système.";
		Properties props = System.getProperties(); //A changer
		props.put("mail.smtp.host", smtpServer);
		Session session = Session.getDefaultInstance(props, null);
		Message msg = new MimeMessage(session);  // A changer
		
		try {
		      msg.setFrom(new InternetAddress(from));
		      msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to, false));
		      msg.setSubject(objet);
		      msg.setText(texte);
		      msg.setHeader("X-Mailer", "LOTONtechEmail");
		      Transport.send(msg);
		      return 1;
		}
		catch (AddressException e) {
		    return 0;
		} 
		catch (MessagingException e) {
			return 0;
		}
		
		
		
		/*
		 * String to = "asseytahago@gmail.com"; // to address. It can be any like gmail,
		 * hotmail etc. final String from = "martialkom123@gmail.com"; // from address.
		 * As this is using Gmail SMTP. final String password = "mercimaman123"; //
		 * password for from mail address.
		 * 
		 * Properties prop = new Properties(); prop.put("mail.smtp.host",
		 * "smtp.gmail.com"); prop.put("mail.smtp.port", "465");
		 * prop.put("mail.smtp.auth", "true"); prop.put("mail.smtp.socketFactory.port",
		 * "465"); prop.put("mail.smtp.socketFactory.class",
		 * "javax.net.ssl.SSLSocketFactory");
		 * 
		 * Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
		 * protected PasswordAuthentication getPasswordAuthentication() { return new
		 * PasswordAuthentication(from, password); } });
		 * 
		 * try {
		 * 
		 * Message message = new MimeMessage(session); message.setFrom(new
		 * InternetAddress(from)); message.setRecipients(Message.RecipientType.TO,
		 * InternetAddress.parse(to));
		 * message.setSubject("Message from Java Simplifying Tech");
		 * 
		 * String msg = "Je teste un programme d'envoi de mail en java. 2KM";
		 * message.setText(msg);
		 * 
		 * 
		 * 
		 * 
		 * Transport.send(message);
		 * 
		 * System.out.println("Mail successfully sent..");
		 * 
		 * } catch (MessagingException e) { e.printStackTrace(); }
		 */
		

	}

}
