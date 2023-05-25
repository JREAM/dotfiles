#!/bin/bash
wget -qO- https://get.pnpm.io/install.sh | sh -
cd ~
pnpm env use --global lts
pnpm add -g @pnpm/exe \
  zx@latest \
  @builder.io/ai-shell \
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

echo "[ Run ] $ ai config set OPENAI_KEY=keyhere"
echo "[ Run ] $ ai config   (Change settings)"
