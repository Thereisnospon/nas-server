echo "--- 生成 docker 私有仓库 ssl 证书" && \
  # 私有仓库 域名
  docker_registry_host="docker.thereisnospon.com" && \
  # 放有 docker ssl 证书的目录路径, 命名也得是 host
  docker_registry_ssl_dir="/volume2/docker/certs" && \
  docker_registry_port="7100" && \
    mkdir -p "$docker_registry_ssl_dir" && \
    docker_host_port_dir="$docker_registry_ssl_dir/$docker_registry_host:$docker_registry_port" && \
    mkdir "$docker_host_port_dir" && \
    openssl req -newkey rsa:4096 -nodes -sha256 \
     -keyout "$docker_host_port_dir/$docker_registry_host".key \
     -x509 \
     -days 365 \
     -out "$docker_host_port_dir/$docker_registry_host".crt && \
echo "--- 生成 docker 私有仓库 ssl 证书 done : $docker_host_port_dir"
