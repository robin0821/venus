wget -N -P /home http://web.acma.gov.au/rrl-updates/spectra_rrl.zip
apt-get update --fix-missing
apt-get install -y zip
cd /home && unzip -o spectra_rrl.zip
export PGPASSWORD=Password1234
wget -N -P /home https://raw.githubusercontent.com/robin0821/venus/master/acma_import.sql
psql -h localhost -d venus -p 5432 -U dataraft -w -a -f /home/acma_import.sql



