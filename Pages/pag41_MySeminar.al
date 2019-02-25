page 50141 "CSD My Seminar"
{
    Caption = 'My Seminar';
    PageType = ListPart;
    SourceTable = "CSD My Seminar";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Seminar No."; "Seminar No.")
                {
                    ApplicationArea = All;

                }
                field(Name; MySeminar.Name)
                {

                }
                field(Duration; MySeminar."Seminar Duration")
                {

                }
                field(Price; MySeminar."Seminar Price")
                {

                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {


                trigger OnAction();
                begin
                    OpenSeminarCard;
                end;
            }
        }
    }
    var
        MySeminar: Record "CSD Seminar";

    trigger OnOpenPage();
    var

    begin
        SetRange("User ID ", UserId);
    end;

    trigger OnAfterGetRecord();
    var

    begin
        if MySeminar.get("Seminar No.") then;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);

    begin
        Clear(MySeminar);
    end;

    local procedure OpenSeminarCard()

    begin
        if MySeminar."No." <> '' then
            Page.Run(Page::"CSD Seminar Card", MySeminar);
    end;
}