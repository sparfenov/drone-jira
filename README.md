# drone-jira

Drone plugin for posting Jira comment.
Also provides ability to set custom fields in Jira tasks.

## Docker

Build the docker image with the following commands:

```
docker build -t plugins/jira .
```

## Usage

### Usage inside drone.yml

Message is optional, same as field_name. So you can post only comments or change issue field or do both.

```
pipeline:
  notify:
    image: plugins/jira
    jira_host: http://jira.local
    jira_issue: TEST-777
    user:user
    password:user-pass
    field_name:build
    field_value:777
    message: |
      hello jira
```

### Test in docker

Execute from the working directory:

```
docker run --rm \
  -e PLUGIN_FIELD_NAME=build \ 
  -e PLUGIN_FIELD_VALUE=777 \
  -e PLUGIN_USER=user \
  -e PLUGIN_PASSWORD=user-pass \
  -e PLUGIN_JIRA_HOST=http://jira.local \
  -e PLUGIN_JIRA_ISSUE=TEST-777 \
  -e PLUGIN_MESSAGE="Hello Jira" \
  plugins/jira
```
