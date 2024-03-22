
docker_env=docker_env/"node_16"/

mkdir -p "$docker_env"/node_modules
mkdir -p "$docker_env"/output

docker run --rm \
  -v ${PWD}/package.json:/app/package.json \
  -v ${PWD}/package-lock.json:/app/package-lock.json \
  -v ${PWD}/tsconfig.json:/app/tsconfig.json \
  -v ${PWD}/webpack.config.js:/app/webpack.config.js \
  -v ${PWD}/src:/app/src \
  -v ${PWD}/"$docker_env"/node_modules:/app/node_modules \
  -v ${PWD}/"$docker_env"/output:/app/output \
  -w /app "node:16" \
  /bin/bash -c "npm install && npm run build"