az network public-ip list -g $args[0] --query "{ip_address : [0].ipAddress}" --output json
