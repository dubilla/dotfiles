alias produrl="ssh -i ~/.ssh/`whoami`_audit_db_dsa `whoami`@`dig +short auditdb.vts.com | grep -E '^[0-9].*[0-9]$'` \'./create_temp_creds.sh\'"
alias auditdb="DATABASE_URL=`produrl` rails c"
