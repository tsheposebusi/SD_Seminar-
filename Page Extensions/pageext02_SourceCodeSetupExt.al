pageextension 50102 "CSD SourceCodeSetupExt" extends "Source Code Setup"
{
    //CSD1.00 -2019-02-10 - D. E. Veloper
    //Chapter 7 - Lab 1-8
    layout
    {
        addafter("Cost Accounting")
        {
            group("CSD SeminarGroup")
            {
                Caption = 'Seminar';
                field("CSD Seminar"; "CSD Seminar")
                {

                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}