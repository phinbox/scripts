REM This script triggers the Machine Policy Evaluation and Update Cycle for SCCM connected computers
REM Sourced from http://blogs.technet.com/b/charlesa_us/archive/2015/03/07/triggering-configmgr-client-actions-with-wmic-without-pesky-right-click-tools.aspx

WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000022}" /NOINTERACTIVE
