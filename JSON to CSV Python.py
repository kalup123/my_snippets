import csv
import json

jsons = []
for line in open('cal_shifts.json', 'r'):
    jsons.append(json.loads(line))




f = csv.writer(open("test.csv", "w", newline=''))

f.writerow(["database", "table", "type", "ts", "commit", "xid", "id", "store", "start_timestamp", "end_timestamp", "needed", "working", "reccuring"])

for x in jsons:
    f.writerow([x["database"],
                x["table"],
                x["type"],
                x["ts"],
                x["commit"],
                x["xid"],
                x["data"]["id"],
                x["data"]["store"],
                x["data"]["start_timestamp"],
                x["data"]["end_timestamp"],
                x["data"]["needed"],
                x["data"]["working"],
                x["data"]["reccuring"]
                ])
