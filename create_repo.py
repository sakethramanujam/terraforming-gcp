#!/usr/bin/python3
import json
import sys
import requests

repo_name = sys.argv[1]
request_payload = {
    "name": repo_name,
    "private": False,
    "has_issues": True,
    "has_wiki": True
}
with open("config.json", "r") as config:
    configs = json.load(config)

user = configs['github']['user']
token = configs['github']['token']
response = requests.post(url="https://api.github.com/user/repos",
                         auth=(user, token), data=json.dumps(request_payload))
