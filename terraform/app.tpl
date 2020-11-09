#!/usr/bin/python

import os, time, sys, logging

#References period of logging for ENV
ENV = 'HELLOWORLD'
TIMER = 3
 
def main():
 logging.basicConfig(filename='helloWorldReadApp.log', level=logging.INFO)
 
 if ENV not in os.environ:
    logging.info('%s is not an environment variable', ENV)
 else:
    print(ENV + ' found')
    logging.info('Logging envrionment variable %s', os.environ[ENV])
 
while True:
 main()
 time.sleep(TIMER)