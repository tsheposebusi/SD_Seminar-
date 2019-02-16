codeunit 50139 "CSD EventSubscriptions"
{
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]

    local procedure PostResJnlLineOnBeforeResLedgEntryInsert
    (var ResLedgerEntry: Record "Res. Ledger Entry";
    ResJournalLine: Record "Res. Journal Line");

    begin
        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No.";
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";
    end;

    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateFindRecords', '', true, true)]
    local procedure ExtendNavigationOnAfterFindRecords
    (var DocumentEntry: Record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text)
    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
        DocNoOfRecords: Integer;
        NextEntryNo: Integer;
    begin
        if PostedSeminarRegHeader.ReadPermission
        then begin
            PostedSeminarRegHeader.Reset;
            PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := PostedSeminarRegHeader.Count;
            with DocumentEntry do begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;
                init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"CSD Posted Seminar Reg. Header";
                "Document Type" := 0;
                "Table Name" := CopyStr(PostedSeminarRegHeader.TableCaption, 1, MaxStrLen("Table Name"));
                "No. of Records" := DocNoOfRecords;
                Insert;
            end;
        end;

        if SeminarLedgerEntry.ReadPermission
        then begin
            SeminarLedgerEntry.Reset;
            SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
            SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := SeminarLedgerEntry.Count;
            with DocumentEntry do begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;
                init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"CSD Seminar Ledger Entry";
                "Document Type" := 0;
                "Table Name" := CopyStr(SeminarLedgerEntry.TableCaption, 1, MaxStrLen("Table Name"));
                "No. of Records" := DocNoOfRecords;
                Insert;
            end;
        end;

    end;

    [EventSubscriber(ObjectType::page, 344, 'OnAfterNavigateShowRecords', '', true, true)]
    local procedure OnAfterNavigateShowRecords(TableID: Integer; DocNoFilter: text; PostingDateFilter: Text;
    ItemTrackingSearch: Boolean)
    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
    begin
        case TableID of
            Database::"CSD Posted Seminar Reg. Header":
                begin
                    PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
                    PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
                    Page.Run(0, PostedSeminarRegHeader);
                end;
            Database::"CSD Seminar Ledger Entry":
                begin
                    SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
                    SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
                    Page.Run(0, SeminarLedgerEntry);
                end;
        end;
    end;

    local procedure ExtendNavigateOnAfterShowRecords(TableID: Integer; DocNoFilter: text; PostingDateFilter: Text;
    ItemTrackingSearch: Boolean)
    begin

    end;
}