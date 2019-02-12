tableextension 50101 "CSD SourceCodeSetupExt" extends "Source Code Setup"
{
    //CSD1.00 - 2019-02-10 - D. E. Veloper
    //Chapter 7 - Lab 1-7
    // - added new fields:
    //- Seminar 

    fields
    {
        field(50100; "CSD Seminar"; Code[10])
        {
            Caption = 'Seminar';
            TableRelation = "Source Code";
        }
    }

    var
        myInt: Integer;
}