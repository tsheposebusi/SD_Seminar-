codeunit 50131 "CSD Seminar Jnl.-Check Line"
{
    //CSD1.00 2019-02-10 - D. E. Veloper
    //Chapter - Lab 2-1
    TableNo = "CSD Seminar Journal Line";

    trigger OnRun()
    begin
        RunCheck(Rec);
    end;

    var
        GlSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
        AllowPostingFrom: date;
        AllowPostingTo: Date;
        ClosingDateTxt: Label 'cannot be a closing date.';
        PostingDateTxt: Label 'is not within your range of allowed posting dates.';

    procedure RunCheck(var SemJnlLine: Record "CSD Seminar Journal Line")
    var
        myInt: Integer;
    begin
        With SemJnlLine DO Begin
            if EmptyLine() then
                exit;
            TestField("Posting Date");
            TestField("Seminar No.");
            case "Charge Type" of
                "Charge Type"::Instructor:
                    TestField("Instructor Resource No.");
                "Charge Type"::Room:
                    TestField("Room Resource No.");
                "Charge Type"::Participant:
                    TestField("Participant Contact No.");
            end;
            if Chargeable then
                testfield("Bill-to Customer No.");

            if "Posting Date" = ClosingDate("Posting Date") then
                FieldError("Posting Date", ClosingDateTxt);
            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                if UserId <> '' then
                    if UserSetup.get(UserId) then begin
                        AllowPostingFrom := UserSetup."Allow FA Posting From";
                        AllowPostingTo := UserSetup."Allow FA Posting To";
                    end;
                if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                    GlSetup.GET;
                    AllowPostingFrom := GlSetup."Allow Posting From";
                    AllowPostingTo := GlSetup."Allow Posting To";
                end;
                if AllowPostingTo = 0D then
                    AllowPostingTo := DMY2Date(31, 12, 9999);
                if ("Posting Date" < AllowPostingFrom) OR
                ("Posting Date" > AllowPostingTo) then
                    FieldError("Posting Date", PostingDateTxt);
                if ("Document Date" <> 0D) then
                    if ("Document Date" = ClosingDate("Document Date")) THEN
                        FieldError("Document Date", PostingDateTxt);
            end;
        END;
    end;

}