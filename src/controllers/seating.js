const { Prisma } = require("@prisma/client");
const prisma = require("../utils/prisma");

const getSeating = async (req, res) => {
  const seatings = await prisma.screen.findUnique({
    where: { id: Number(req.params.id) },
    include: {
      seats: true,
    },
  });
  res.json({ seats: seatings.seats });
};

const createTicket = async (req, res) => {
  const { customerId, screeningId, seats } = req.body;
  const ticket = await prisma.ticket.create({
    data: {
      customerId: Number(customerId),
      screeningId: Number(screeningId),
      seats: { create: seats },
    },
    include: {
      seats: true,
    },
  });
};
module.exports = {
  getSeating,
  createTicket,
};
