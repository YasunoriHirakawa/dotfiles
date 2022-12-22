alias cat="batcat"
alias cbt="catkin build --this --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1"
alias cbtd="catkin build --this --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug"
alias disp="export $(tmux show-environment | grep DISPLAY)"
alias gui-logout="gnome-session-quit --logout --no-prompt"
alias history="history -iD 1 | less"
alias refresh="source /home/${USER}/.zshrc"
alias rp="rosparam set use_sim_time true; rosbag play -l --clock"
alias rsync="rsync -avzhP"
alias scl="screen -list"
alias scr="screen -r"
alias scs="screen -S"
alias pip="pip3"
alias python="python3"
alias vi="nvim"
alias vim="nvim"

function copy()
{
    xsel --clipboard --input
}

function cdh()
{
    cd ~/$1
}

function easync()
{
    case $1 in
        -f | --from)
            real=$(realpath $3)
            rsync $2:$real/ $real/
            ;;
        -t | --to)
            real=$(realpath $3)
            rsync $real/ $2:$real/
            ;;
        *)
            echo "Arguments:"
            echo "--from | -f   Sync directory from remote"
            echo "--to | -t   Sync directory to remote"
            ;;
    esac
}

function rosync()
{
    easync -t $1 /home/${USER}/catkin_ws/src/$2
    easync -t $1 /home/${USER}/catkin_ws/build/$2
    easync -t $1 /home/${USER}/catkin_ws/devel/lib/$2
    if ls /home/${USER}/catkin_ws/devel/include/$2 &> /dev/null; then
        easync -t $1 /home/${USER}/catkin_ws/devel/include/$2
    fi
    easync -t $1 /home/${USER}/catkin_ws/devel/share/$2
}

function fpush()
{
    git add -A && git commit -m "$1" && git push
}


function rosccc()
{
    while : ; do
        ls CMakeLists.txt &> /dev/null
        if [ $? -eq 0 ]; then
            break
        fi
        cd ../
    done
    packname=$(basename $(pwd))
    ln -s ~/catkin_ws/build/$packname/compile_commands.json
}

# dont activate me!!!!
# function ls()
# {
#     while :
#     do
#         sl -alF
#     done
# }
