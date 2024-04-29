package onlie_test_web_app.service;

import lombok.SneakyThrows;

import javax.mail.*;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class GmailService {
    private static final String sender = "shukurullayevjavoxir777@gmail.com";
    private static final String password = "eyqj zaed dudr llaq";
    private static GmailService gmail;

    private GmailService() {
    }

    public static GmailService getInstance() {
        if (gmail == null) {
            gmail = new GmailService();
        }
        return gmail;
    }


    @SneakyThrows
    public void sendCodeToGmail(String receiverGmail, String messageCode) {

        if (receiverGmail.isBlank()) {
            System.out.println("Gmail cannot be null");
            return;
        }

        Session session = getSession(getProperties(), sender, password);
        MimeMessage mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(sender);

        mimeMessage.setRecipients(Message.RecipientType.TO, receiverGmail);
        mimeMessage.setContent(messageCode, "text/plain");
        mimeMessage.setSubject("Online test");
        Transport.send(mimeMessage);

    }

    public Properties getProperties() {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        return properties;
    }

    public Session getSession(Properties properties, String sender, String password) {
        return Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });
    }

    public boolean checkedCode(String copy, String code) {
        return copy.equals(code);
    }
}
