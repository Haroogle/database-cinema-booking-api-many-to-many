-- CreateTable
CREATE TABLE "Seating" (
    "id" SERIAL NOT NULL,
    "seatNum" VARCHAR(3) NOT NULL,
    "screenId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Seating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_SeatingToTicket" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_SeatingToTicket_AB_unique" ON "_SeatingToTicket"("A", "B");

-- CreateIndex
CREATE INDEX "_SeatingToTicket_B_index" ON "_SeatingToTicket"("B");

-- AddForeignKey
ALTER TABLE "Seating" ADD CONSTRAINT "Seating_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "Screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SeatingToTicket" ADD CONSTRAINT "_SeatingToTicket_A_fkey" FOREIGN KEY ("A") REFERENCES "Seating"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SeatingToTicket" ADD CONSTRAINT "_SeatingToTicket_B_fkey" FOREIGN KEY ("B") REFERENCES "Ticket"("id") ON DELETE CASCADE ON UPDATE CASCADE;
