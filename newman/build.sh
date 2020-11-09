#!/bin/bash

export my_version='v0.3'
sudo docker build -t postman_checks:"${my_version}" .


