#!/usr/bin/env bash

echo "Runing backup..."
for i in \
$(docker ps --filter "name=gitea|jenkins|openproject" | tail -n+2 | awk '{  print $1 }'); do docker export -o ${i}-ci-$(date +"%m-%d-%Y").tar ${i}; \
done
