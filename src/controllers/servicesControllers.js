const sgMail = require("@sendgrid/mail");
const client = require("twilio")(process.env.ACCOUNTSID, process.env.AUTHTOKEN);

const sendEmail = async (req, res) => {
  try {
    sgMail.setApiKey(process.env.MAIL_KEY);
    const resolved = await sgMail.send(req.body);

    return res.status(200).json(resolved);
  } catch (err) {
    throw new Error(err);
  }
};

const sendMessage = async (req, res) => {
  try {
    const resolved = await client.messages.create(req.body);

    return res.status(200).json(resolved);
  } catch (err) {
    return res.status(500).json(err);
  }
};

module.exports = { sendEmail, sendMessage };
