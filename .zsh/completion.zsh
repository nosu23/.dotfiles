# load command completion function
autoload -Uz compinit
# load compinit
compinit

# 補完方法毎にグループ化する。
# 補完方法の表示方法
#   %B...%b: 「...」を太字にする。
#   %d: 補完方法のラベル
#zstyle ':completion:*' format '%B%d%b'
#zstyle ':completion:*' group-name ''

# 補完侯補をメニューから選択する。
# select=2: 補完候補を一覧から選択する。
#           ただし、補完候補が2つ以上なければすぐに補完する。
#zstyle ':completion:*:default' menu select=2

# 補完候補に色を付ける。
# "": 空文字列はデフォルト値を使うという意味。
zstyle ':completion:*:default' list-colors ""

# 補完候補がなければより曖昧に候補を探す。
# m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
# r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

# 補完方法の設定。指定した順番に実行する。
# _oldlist 前回の補完結果を再利用する。
# _complete: 補完する。
# _match: globを展開しないで候補の一覧から補完する。
# _history: ヒストリのコマンドも補完候補とする。
# _ignored: 補完候補にださないと指定したものも補完候補とする。
# _approximate: 似ている補完候補も補完候補とする。
# _prefix: カーソル以降を無視してカーソル位置までで補完する。
#zstyle ':completion:*' completer \
    _oldlist _complete _match _history _ignored _approximate _prefix
# 補完候補をキャッシュする。
#zstyle ':completion:*' use-cache yes
# 詳細な情報を使う。
#zstyle ':completion:*' verbose yes
# sudo時にはsudo用のパスも使う。
#zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
# zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#zstyle ':completion:*' list-colors $LSCOLORS