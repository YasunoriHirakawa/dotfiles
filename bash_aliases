alias python="python3"
alias pip="pip3"
alias scl="screen -list"
alias scr="screen -r"
alias scs="screen -S"
alias rsync="rsync -avzhP"
alias rviz="/home/amsl/scripts/rviz.sh"
alias rdp="source /home/amsl/scripts/rdp.sh &&"
alias x11="source /home/amsl/scripts/x11.sh &&"

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

# dont activate me!!!!
# function ls()
# {
#     while :
#     do
#         sl -alF
#     done
# }
