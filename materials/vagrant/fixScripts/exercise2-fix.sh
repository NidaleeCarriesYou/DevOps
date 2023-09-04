#!/bin/bash
#add fix to exercise2 here
cd /etc
sed -i "s/127.0.0.1/#127.0.0.1/g" hosts
