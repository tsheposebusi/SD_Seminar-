page 50100 "CSD Seminar Setup"

{
    caption = 'Seminar Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Setup";

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Seminar Nos."; "Seminar Nos")
                {

                }
                field("Seminar Registration Nos."; "Seminar Registration Nos.")
                {

                }
                field("Posted Seminar Reg. Nos."; "Posted Seminar Reg. Nos.")
                {

                }
            }
        }
    }

    trigger OnOpenPage()

    begin
        IF not get then begin
            Init;
            Insert;
        end;
    end;
}