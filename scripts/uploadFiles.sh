#!/scripts/bash
set -eu

read -p "Environment? " STAGE
echo "Uploading Static Files to ${STAGE}..."

if [ $STAGE == "dev" ]
  then
     BUCKET_NAME="static-sites-dev-h42lp5s2"
     SITE_PATH="/peaks-valleys"
  else
     BUCKET_NAME="static-sites-prod-2f8c8wur"
     SITE_PATH="/peaks-valleys"
fi

echo "${BUCKET_NAME}${SITE_PATH}"

aws s3 sync --acl 'public-read' --delete ./src/ "s3://${BUCKET_NAME}${SITE_PATH}"
