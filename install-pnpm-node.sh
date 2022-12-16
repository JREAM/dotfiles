#!/bin/bash
wget -qO- https://get.pnpm.io/install.sh | sh -
cd ~
pnpm env use --global lts
pnpm add -g @pnpm/exe \
  sl \
  pm2@latest \
  vtop@latest \
  esbuild@latest \
  typescript@latest \
  ts-node@latest \
  fastify-cli@latest
