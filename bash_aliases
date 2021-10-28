alias python="python3"
alias pip="pip3"
alias scl="screen -list"
alias scr="screen -r"
alias scs="screen -S"
alias rsync="rsync -avzhP"

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
