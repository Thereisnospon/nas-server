function confirm() {
  if [ -n "$1" ]; then
    :
  else
    echo "confirm arg1 empty"
    exit 3
  fi
   if [ -n "$2" ]; then
      :
    else
      echo "confirm $1 value empty"
      exit 3
    fi
  # 提示用户输入并读取用户输入
  read -r -p "user config $1=$2 (y/n): " answer
  # 根据用户输入采取不同的行动
  case $answer in
      [yY] | [yY][eE][sS])
          # 如果用户输入的是 y、Y、yes 或 YES，那么继续运行
          echo "Continuing..."
          ;;
      [nN] | [nN][oO])
          # 如果用户输入的是 n、N、no 或 NO，那么取消运行
          echo "Aborting..."
          exit 1
          ;;
      *)
          # 如果用户输入的既不是 'y'/'Y'/'yes'/'YES' 也不是 'n'/'N'/'no'/'NO'，则提示错误并退出
          echo "Invalid input..."
          exit 1
          ;;
  esac
}

function checkFileExist() {
    file_path=$1
    if [ -f "$file_path" ]; then
        echo "The file $1 exists "
    else
        echo "The file $1 does not exist. $2"
         exit 2
    fi
}

cur_dir="$(pwd)"
local_env="$cur_dir/local.env"

checkFileExist "$local_env" "请参考 $local_env"
source "$local_env"