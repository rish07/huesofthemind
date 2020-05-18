const functions = require('firebase-functions');
const admin = require("firebase-admin")
admin.initializeApp()
const nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({

    host: 'smtp.gmail.com',
    port: 465,
    secure: true,
    auth: {
        user: functions.config().someservice.email,
        pass: functions.config().someservice.pass,
    }
});

exports.sendEmail = functions.https.onCall((data, context,error, info) => {
    const mailOptions = {
        from: `rishirajsinghchhabra@gmail.com`,
        to: 'r4rchhabra@gmail.com',
        subject: 'New Submission',
        attachments: [
            {   // encoded string as an attachment
              filename: 'something.png',
              content: data.image,
              encoding: 'base64'
            }
          ],
        html: `<html>
        <br>
        <br>
        Name: ${data.name}<br><br>Instagram Handle: ${data.insta}<br><br>Write Up: ${data.writeUp}
        
        
        </html>`,

   
    };
    
    return transporter.sendMail(mailOptions, (error, data) => {
        if (error) {
            console.log(error)
            return
        }
        console.log("Sent!")
    });
});



