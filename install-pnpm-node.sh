#!/bin/bash
wget -qO- https://get.pnpm.io/install.sh | sh -
cd ~
pnpm env use --global lts
pnpm add -g @pnpm/exe \
  ntl \
  pm2 \
  vtop \
  fastify-cli
