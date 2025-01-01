#!/bin/sh

dotfiles_root=$(cd $(dirname $0)/.. && pwd)


# linklist.txtのコメントを削除
__remove_linklist_comment() {(
    # '#'以降と空行を削除
    sed -e 's/\s*#.*//' \
        -e '/^\s*$/d' \
        $1
)}

# シンボリックリンクを作成
cd ${dotfiles_root}
linklist="script/linklist.txt"

#while read LINE
#do
#echo ${LINE}
## コマンド
#done < ${linklist}
#
#
#
#now=$(pwd)
#echo ${now}

[ ! -r "$linklist" ] && return
__remove_linklist_comment "$linklist" | while read target link; do
    # ~ や環境変数を展開
    target=$(eval echo "${PWD}/${target}")
    link=$(eval echo "${link}")
    # シンボリックリンクを作成
    #echo ${target}
    #echo ${link}

    mkdir -p $(dirname ${link})
    ln -fsn ${target} ${link}
done