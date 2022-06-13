const prisma = require("../utils/prisma");

const createTicket = async (req, res) => {
  const { screeningId, customerId, seatNumber } = req.body;
  const createdTicket = await prisma.ticket.create({
    data: {
      screeningId: screeningId,
      customerId: customerId,
      seat: {
        create: {
          number: seatNumber,
        },
      },
    },
  });

  res.json({ data: createdTicket });
};

module.exports = { createTicket };
