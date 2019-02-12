page 50122 "CSD Seminar Registers"
{
    //csd1.00 - 2019-02-10 - D. E. Veloper
    //Chapter 7 - Lab 2-11
    PageType = List;
    SourceTable = "CSD Seminar Register";
    Caption = 'Seminar Registers';
    Editable = false;
    UsageCategory = Lists;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {


                }
                field("Creation Date"; "Creation Date")
                {


                }
                field("Source Code"; "Source Code")
                {


                }
                field("Journal Batch Name"; "Journal Batch Name")
                {


                }
            }
        }
        area(Factboxes)
        {
            systempart(Links; Links)
            {

            }
            systempart(Notes; Notes)
            {

            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                Image = WarrantyLedger;
                RunObject = codeunit "CSD Seminar Reg.-Show Ledger";
            }
        }
    }
}