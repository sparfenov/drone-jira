#!/bin/sh

if [ -n "${PLUGIN_MESSAGE}" ]; then
	curl \
		-u ${PLUGIN_USER}:${PLUGIN_PASSWORD} \
		-X POST \
		--data "{\"body\": \"${PLUGIN_MESSAGE}\"}"\
		-H "Content-Type: application/json" \
		${PLUGIN_JIRA_HOST}/rest/api/2/issue/${PLUGIN_JIRA_ISSUE}/comment
fi

if [ -n "${PLUGIN_FIELD_NAME}" ]; then
	curl \
		-u ${PLUGIN_USER}:${PLUGIN_PASSWORD} \
		-X PUT \
		--data "{\"fields\": {\"${PLUGIN_FIELD_NAME}\":${PLUGIN_FIELD_VALUE}}}"\
		-H "Content-Type: application/json" \
		${PLUGIN_JIRA_HOST}/rest/api/2/issue/${PLUGIN_JIRA_ISSUE};
fi
