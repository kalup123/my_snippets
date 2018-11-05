from ua_parser import user_agent_parser

import pandas as pd

ua_data = pd.read_csv("user agent data.csv")

ua_data['context_user_agent_str'] = ua_data['context_user_agent'].astype('str')

ua_data['os_parsed'] = 'Unknown'
ua_data['broswer_parsed'] = 'Unknown'
ua_data['device_parsed'] = 'Unknown'


for index, row in ua_data.iterrows():

    ua_data['os_parsed'][index] = user_agent_parser.ParseOS(ua_data['context_user_agent_str'][index])['family']
    ua_data['broswer_parsed'][index] = user_agent_parser.ParseUserAgent(ua_data['context_user_agent_str'][index])['family']
    ua_data['device_parsed'][index] = user_agent_parser.ParseDevice(ua_data['context_user_agent_str'][index])['brand']





ua_data.to_csv("out1.csv")