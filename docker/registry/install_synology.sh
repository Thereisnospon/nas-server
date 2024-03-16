echo "--- 生成 docker 私有仓库 ssl 证书 https://jyts6fqpbu.feishu.cn/docx/P2XkdNhrToAqVmxcJlecHtovnec" && \
  # 私有仓库 域名
  docker_registry_host="docker.thereisnospon.com" && \
  # 私有仓库 端口
  docker_registry_port="7100" && \
  # 放有 docker ssl 证书的目录路径, 命名也得是 host
  docker_registry_ssl_dir="/tmp/docker_tmp_certs/$docker_registry_host" && \
    mkdir -p "~/.docker/certs.d/$docker_registry_host:$docker_registry_port" && \
    cp \
     "$docker_registry_ssl_dir/$docker_registry_host.key" \
     "~/.docker/certs.d/$docker_registry_host:$docker_registry_port/$docker_registry_host.key" && \
    cp \
     "$docker_registry_ssl_dir/$docker_registry_host.crt"  \
     "~/.docker/certs.d/$docker_registry_host:$docker_registry_port/$docker_registry_host.crt" && \
echo "--- 生成 docker 私有仓库 done"

