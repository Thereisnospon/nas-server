

echo "--- 生成 docker 私有仓库 ssl 证书" && \
  # 私有仓库 域名
#  docker_registry_host="docker.thereisnospon.com" && \
#  # 放有 docker ssl 证书的目录路径, 命名也得是 host
#  docker_registry_ssl_dir="/volume2/docker/certs" && \
#  docker_registry_port="7100" && \
    echo "设置路径..." && \
#    docker_host_port_dir="$docker_registry_ssl_dir/$docker_registry_host:$docker_registry_port" && \
#    cur_ssl_key="$docker_host_port_dir/$docker_registry_host".key && \
#    cur_ssl_crt="$docker_host_port_dir/$docker_registry_host".crt && \
#    docker_ssl_crt="/certs/$docker_registry_host".crt && \
#    docker_ssl_key="/certs/$docker_registry_host".key && \
#    chmod 600 "$cur_ssl_crt" && \
    docker run -d -p 7100:5000 \
      --restart=always --name registry \
#      -v "$cur_ssl_crt":"$docker_ssl_crt" \
#      -v "$cur_ssl_key":"$docker_ssl_key" \
#      -e REGISTRY_HTTP_TLS_CERTIFICATE="$docker_ssl_crt" \
#      -e REGISTRY_HTTP_TLS_KEY="$docker_ssl_key" \
      registry:2