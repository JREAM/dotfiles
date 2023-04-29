#!/bin/bash
wget -qO- https://get.pnpm.io/install.sh | sh -
cd ~
pnpm env use --global lts
pnpm add -g @pnpm/exe \
  zx@latest \
  pkg@latest \
  hyperfine@latest \
  pm2@latest \
  vtop@latest \
  esbuild@latest \
  eslint@latest \
  typescript@latest \
  ts-node@latest \
  turbo@latest \
  fastify-cli@latest\
  @types/node\
  @types/tap\
  tap
