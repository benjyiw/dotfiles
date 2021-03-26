# functions and aliases for a tmp directory for every day
# super old thing that i created, still use it cus it's kinda nice?
work() {
  local input="$@"
  local today=$(date "+%Y%m%d")
  local yesterday=$(date -v -1d "+%Y%m%d")
  local work_path="${HOME}/Documents/work"
  case "$input" in
    yesterday|y)
      mkdir -p "${work_path}/${yesterday}"
      cd "${work_path}/${yesterday}"
      ;;
    clean)
      echo "cleaning empty directories:"
      find "${work_path}" -maxdepth 1 -type d -empty -print -delete
      ;;
    *|today)
      mkdir -p "${work_path}/${today}"
      cd "${work_path}/${today}"
      ;;
  esac
}

today() {
     local today=$(date "+%Y%m%d")
     local work_path="${HOME}/Documents/work/"
     local today_path="${work_path}/${today}"
     mkdir -p "${today_path}"
     cd "${today_path}"
}

mkticket() {
  if [ -z "$@" ]; then
    echo "err: supply ticket number"
  else
    local input="$@"
    local today=$(date "+%Y%m%d")
    local work_path="${HOME}/Documents/work/"
    local ticket_path="${work_path}/${today}/$input"
    mkdir -p "${ticket_path}"
    cd "${ticket_path}"
  fi
}

lntoday() {
  local input="$@"
  local today=$(date "+%Y%m%d")
  local work_path="${HOME}/Documents/work/"
  if [[ $PWD == "$work_path"* ]]; then
    mkdir -p ../${today}/
    gln -rs "$input" ../${today}/${input}
  else
    echo "not in a work directory"
  fi
}
