alias python="python3"
alias pip="pip3"
alias history="history -iD 1 | less"
alias scl="screen -list"
alias scr="screen -r"
alias scs="screen -S"
alias rsync="rsync -avzhP"
alias rdp="source /home/amsl/scripts/rdp.sh &&"
alias x11="source /home/amsl/scripts/x11.sh &&"
alias refresh="source /home/amsl/.zshrc"
alias cbt="catkin build --this --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1"
alias cbtd="catkin build --this --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug"

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
    ln -s ../../build/$packname/compile_commands.json
}

# dont activate me!!!!
# function ls()
# {
#     while :
#     do
#         sl -alF
#     done
# }
