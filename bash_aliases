alias python="python3"
alias pip="pip3"

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
