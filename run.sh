#!/bin/sh


docker compose -f backend/docker-compose* up -d && \
    docker compose -f frontends/livros-angular/docker-compose* up -d && \
    docker compose -f frontends/livros-next/docker-compose* up -d && \
    docker compose -f frontends/livros-react/docker-compose* up -d