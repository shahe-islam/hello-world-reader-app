#!/usr/bin/python

import os, time, sys, logging

#References period of logging for ENV
ENV = sys.argv[1]
TIMER = sys.argv[2]
 
def main():
 logging.basicConfig(filename='helloWorldReadApp.log', level=logging.INFO)
 
 if ENV not in os.environ:
    logging.info('%s is not an environment variable', ENV)
 else:
    print('Success')
    logging.info('Logging envrionment variable %s', os.environ[ENV])
 
while True:
 main()
 time.sleep(TIMER)

 ### Look into addHandler for logging to print out the log to the screen effectively