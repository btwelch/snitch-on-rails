# Snitch Host / Port
host="localhost"; # The hostname where your Snitch server lives
port=80; # The port where your snitch server is listening (80 is nice if Snitch is the only thing running)

server_name="devservername"; # Unique name of server for which you are displaying status
server_group=1;   # Columnar grouping/display of servers
server_order=100; # Order of server within column

##
## Go to the repo you want to report status on, and parse + post its status to the server
##
cd /opt/yourrepo1;
branch_label="Repo1"
branch_name=$(git branch | awk '/\*/ { print $2; }');
branch_status=$(git status);
branch_log=""; #$(git log);

curl --verbose --data "server_name=$server_name&server_group=$server_group&server_order=$server_order&branch_label=$branch_label&branch_name=$branch_name&branch_status=$branch_status&branch_log=$branch_log" $host:$port/servers/snitch

##
## Go to the repo you want to report status on, and parse + post its status to the server
##
cd /opt/yourrepo2;
branch_label="Repo2"
branch_name=$(git branch | awk '/\*/ { print $2; }');
branch_status=$(git status);
branch_log=""; #$(git log);

curl --verbose --data "server_name=$server_name&server_group=$server_group&server_order=$server_order&branch_label=$branch_label&branch_name=$branch_name&branch_status=$branch_status&branch_log=$branch_log" $host:$port/servers/snitch
