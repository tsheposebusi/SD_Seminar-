page 50121 "CSD Seminar Ledger Entries"
{
    //CSD1.00 - 2019-02-10 - D,E, Veloper
    //Chapter 7 - Lab 2-9
    PageType = List;
    Caption = 'Seminar Ledger Entries';
    SourceTable = "CSD Seminar Ledger Entry";
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Posting Date"; "Posting Date")
                {

                }
                field("Document No."; "Document No.")
                {

                }
                field("Document Date"; "Document Date")
                {
                    Visible = false;

                }
                field("Entry Type"; "Entry Type")
                {

                }
                field("Seminar No."; "Seminar No.")
                {

                }
                field(Description; Description)
                {

                }
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {

                }
                field("Charge Type"; "Charge Type")
                {

                }
                field(Type; Type)
                {

                }
                field(Quantity; Quantity)
                {

                }
                field("Unit Price"; "Unit Price")
                {

                }
                field("Total Price"; "Total Price")
                {

                }
                field(Chargeable; Chargeable)
                {

                }
                field("Participant Contact No."; "Participant Contact No.")
                {

                }
                field("Participant Name"; "Participant Name")
                {

                }
                field("Instructor Resource No."; "Instructor Resource No.")
                {

                }
                field("Room Resource No."; "Room Resource No.")
                {

                }
                field("Starting Date"; "Starting Date")
                {

                }
                field("Seminar Registration No."; "Seminar Registration No.")
                {

                }
                field("Entry No."; "Entry No.")
                {

                }
            }
        }
        area(Factboxes)
        {
            systempart("Record Links"; Links)
            {

            }
            systempart("Notes"; Notes)
            {

            }
        }
    }


}