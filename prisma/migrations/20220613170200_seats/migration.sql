/*
  Warnings:

  - You are about to drop the `_SeatToTicket` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_SeatToTicket" DROP CONSTRAINT "_SeatToTicket_A_fkey";

-- DropForeignKey
ALTER TABLE "_SeatToTicket" DROP CONSTRAINT "_SeatToTicket_B_fkey";

-- DropTable
DROP TABLE "_SeatToTicket";

-- CreateTable
CREATE TABLE "TicketsWithSeats" (
    "ticketID" INTEGER NOT NULL,
    "seatID" INTEGER NOT NULL,

    CONSTRAINT "TicketsWithSeats_pkey" PRIMARY KEY ("ticketID","seatID")
);

-- AddForeignKey
ALTER TABLE "TicketsWithSeats" ADD CONSTRAINT "TicketsWithSeats_ticketID_fkey" FOREIGN KEY ("ticketID") REFERENCES "Ticket"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TicketsWithSeats" ADD CONSTRAINT "TicketsWithSeats_seatID_fkey" FOREIGN KEY ("seatID") REFERENCES "Seat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
