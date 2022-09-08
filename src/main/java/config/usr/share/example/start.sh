#!/bin/bash
pkill -xf "Example Main"
cd /usr/share/example/

exec -a 'Example' /usr/share/example/bin/example


