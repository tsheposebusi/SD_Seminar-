codeunit 50134 "CSD Seminar Reg.-Show Ledger"
{
    //CSD1.00 - 2019-02-10 - D. E. Veloper
    //Chapter 7 - Lab 2-10
    TableNo = "CSD Seminar Register";
    trigger OnRun()
    begin
        SeminarLedgerEntry.SetRange("Entry No.", "From Entry No.", "To Entry No.");
        Page.Run(Page::"CSD Seminar Ledger Entries", SeminarLedgerEntry);
    end;

    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";

}