Generate JWT shared secret key before deployment by running
`openssl rand -hex 32 | tr -d "\n" > "./jwtsecret"`