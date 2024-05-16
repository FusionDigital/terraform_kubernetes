#/bin/sh
aws s3api create-bucket --bucket terraform-dpozzi-eks-cluster-tfstate-state \
    --region us-east-2 \
    --create-bucket-configuration \
    LocationConstraint=us-east-2


aws s3api put-bucket-encryption \
    --bucket  terraform-dpozzi-eks-cluster-tfstate-state \
    --server-side-encryption-configuration={\"Rules\":[{\"ApplyServerSideEncryptionByDefault\":{\"SSEAlgorithm\":\"AES256\"}}]}


aws iam create-user --user-name terraform-deployer

export ARN=$(aws iam get-user  --user-name terraform-deployer --output text |cut -f2)
echo $ARN


aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --user-name terraform-deployer
# Output: expect none when the command execution is successful

aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess --user-name terraform-deployer
# Output: expect none when the command execution is successful


cat <<-EOF > policy.json
{
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${ARN}"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::terraform-dpozzi-eks-cluster-tfstate-state"
        }
    ]
}
EOF
aws s3api put-bucket-policy --bucket terraform-dpozzi-eks-cluster-tfstate-state --policy file://policy.json


aws s3api put-bucket-versioning --bucket terraform-dpozzi-eks-cluster-tfstate-state --versioning-configuration Status=Enabled

aws dynamodb create-table --table-name terraform-dpozzi-eks-tfstate-state-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
