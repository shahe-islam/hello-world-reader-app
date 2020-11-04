#!/usr/bin/python

import os, time, sys, logging

#References period of logging for ENV
TIMER = 3
 
def main():
 logging.basicConfig(filename='helloWorldReadApp.log', level=logging.INFO)
 
 if [1] not in os.environ:
    logging.info('%s is not an environment variable', [1])
 else:
    print('Success')
    logging.info('Logging envrionment variable %s', os.environ[1])
 
while True:
 main()
 time.sleep(TIMER)

 ### Look into addHandler for logging to print out the log to the screen effectively