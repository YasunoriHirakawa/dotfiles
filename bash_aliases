alias python="python3"
alias pip="pip3"
alias history="history -iD 1"
alias scl="screen -list"
alias scr="screen -r"
alias scs="screen -S"
alias rsync="rsync -avzhP"
alias rviz="/home/amsl/scripts/rviz.sh"
alias rdp="source /home/amsl/scripts/rdp.sh &&"
alias x11="source /home/amsl/scripts/x11.sh &&"
alias sa="ssh chopper"

function copy()
{
    echo $1 | xsel --clipboard --input
}

function ch()
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

# dont activate me!!!!
# function ls()
# {
#     while :
#     do
#         sl -alF
#     done
# }
