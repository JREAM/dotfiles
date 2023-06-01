#!/bin/bash
wget -qO- https://get.pnpm.io/install.sh | sh -
cd ~ || exit
pnpm env use --global lts
pnpm add -g @pnpm/exe \
  @builder.io/ai-shell \
  @types/node\
  @types/tap\
  esbuild@latest \
  eslint@latest \
  fastify-cli@latest\
  hyperfine@latest \
  pkg@latest \
  pm2@latest \
  tap \
  ts-node@latest \
  turbo@latest \
  typescript@latest \
  vtop@latest \
  zx@latest

echo "[ Run ] $ ai config set OPENAI_KEY=keyhere"
echo "[ Run ] $ ai config   (Change settings)"
