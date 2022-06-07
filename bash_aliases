alias python="python3"
alias pip="pip3"
alias history="history -iD 1 | less"
alias scl="screen -list"
alias scr="screen -r"
alias scs="screen -S"
alias rsync="rsync -avzhP"
alias rdp="source /home/amsl/scripts/rdp.sh &&"
alias x11="source /home/amsl/scripts/x11.sh &&"
alias sa="ssh chopper"
alias refresh="source /home/amsl/.zshrc"
alias cbt="catkin build --this --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && refresh"

function copy()
{
    xsel --clipboard --input
}

function cdh()
{
    cd ~/$1
}

function fpush()
{
    git add -A && git commit -m "$1" && git push
}

function de()
{
    pts=$(w | grep "/bin/tmux new-session -s main" | awk '{print $2}')
    if [ -z "$pts" ]; then
        pts=$(w | grep "/bin/tmux a -t main" | awk '{print $2}')
    fi
    proc=$(ps aux | grep "[a]msl@$pts" | awk '{print $2}')
    echo "Killing $pts: $proc"
    kill -KILL $proc
}

function rosccc()
{
    roscd $1
    ln -s ../../build/$1/compile_commands.json
}

# dont activate me!!!!
# function ls()
# {
#     while :
#     do
#         sl -alF
#     done
# }
