# brightbox-keel-action

Action to trigger a Keel native webhook

## Inputs

### image

**Required** The image to notify Keel about eg. 'cr.brightbox.com/acc-abcde/container_name/app_name'

### tag

**Required** The tag of the image to notify Keel about eg. 'staging-19701001.0001'

### hook_url

**Required** The URL of Keel, either the service itself (port 9300) or it's ingress eg. 'https://keel.cip-abcde.gb1.brightbox.com/v1/webhooks/native'

### basic_auth_user

If basic auth is enabled on the hook, the user for basic auth eg. 'username'

### basic_auth_password

If basic auth is enabled on the hook, the user for basic auth eg. 'hunter2'
