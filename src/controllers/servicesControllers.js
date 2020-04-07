const sgMail = require('@sendgrid/mail');
const client = require('twilio')('ACcab532724545f1d87d44ffb4ee01d52f' '9f3813e03072586e0d6210f7141d0aec');

const sendEmail = async (req, res) => {
  try {
    sgMail.setApiKey('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');
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
