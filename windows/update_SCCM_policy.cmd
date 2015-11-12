REM This script triggers the Machine Policy Evaluation and Update Cycle for SCCM connected computers

WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000022}" /NOINTERACTIVE
