# Runs and deploys CDK
sudo yum -y install gcc gcc-c++ python3 python3-devel unixODBC unixODBC-devel aws-cfn-bootstrap
sudo npm install -g aws-cdk
cd ~/amazon-redshift-infrastructure-automation
python3 -m venv .env
source .env/bin/activate
pip install -r requirements.txt
if [ -z "${STACK_NAME}" ]
then
	read -p $'[Input Required] Enter a stack name: ' stack
	export STACK_NAME=$stack
fi
cdk destroy --all --require-approval never
python3 ./scripts/delete_secrets.py