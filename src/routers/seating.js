const { Router } = require("express");
const express = require("express");
const { getSeating, createTicket } = require("../controllers/seating");

const router = express.Router();
router.get("/:id", getSeating);
router.post("/", createTicket);

module.exports = router;
