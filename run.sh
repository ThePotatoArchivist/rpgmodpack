set -e
set -u
set -o pipefail

PACK_DIR="$(dirname "$(realpath $0)")"

if [ ! -f .GAME_DIR ]; then
    read -p "Type path to game dir: " GAME_DIR
    GAME_DIR="$(realpath "$GAME_DIR")"
    if [ ! -d "$GAME_DIR/mods" ]; then
        echo "Could not find $GAME_DIR/mods"
        exit 1
    fi
    echo "$GAME_DIR" > .GAME_DIR
else
    read GAME_DIR < .GAME_DIR
fi

cd "$GAME_DIR"

packwiz-installer -g -s both "$PACK_DIR/pack.toml"

echo "Mods updated!"
