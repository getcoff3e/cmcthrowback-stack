#!/bin/bash
./preloader.sh || chmod +x ./preloader.sh && ./preloader.sh && \
docker-compose up -d && docker-compose status
