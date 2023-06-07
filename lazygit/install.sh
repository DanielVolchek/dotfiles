DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CONF=$HOME/.config/lazygit

mkdir -p $CONF

FILE=$CONF/config.yml

ln -sf $DIR/config.yml $FILE

lazygit --use-config-file $FILE

