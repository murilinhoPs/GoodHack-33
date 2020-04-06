const router = require("express").Router();
const servicesController = require("../controllers/servicesControllers");

router
  .post("/email", servicesController.sendEmail)
  .post("/message", servicesController.sendMessage);

module.exports = router;
