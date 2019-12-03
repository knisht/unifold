
inoremap  <C-o>:call RunUnifold("i")<CR>
nnoremap  :call RunUnifold("n")<CR>


let s:configurationFileName = 'UnifoldCharacters.txt'


function! RunUnifold(mode)
    let l:line = getline('.')
    let l:char = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let index = col('.')
    let currentLine = l:line[0:index-1]
    let l:currentLine = s:CreateReplacedString(l:currentLine, a:mode)
    let continuation = l:line[index:]
    let replaced =  (currentLine . continuation)
    call setline(line('.'), replaced) 
    call cursor(l:line, len(currentLine))
endfunction

function! s:CreateReplacedString(line, mode)
    let l:fileContent = s:CollectUnifoldConfiguration()
    let l:changing = a:line
    for l:entry in l:fileContent
        let l:binding = split(l:entry)
        let l:forReplace = l:binding[0]
        let l:toReplace  = l:binding[1]
        if a:mode == 'i' 
            let l:pattern = l:forReplace . "$" 
            let l:flag = ""
        else 
            let l:pattern = l:forReplace
            let l:flag = "g"
        endif
        if l:changing =~ pattern 
            let l:changing = substitute(l:changing, pattern, l:toReplace, l:flag)
            if a:mode == 'i'
                break
            endif
        endif
    endfor
    return l:changing 
endfunction


function! s:CollectUnifoldConfiguration()
    let l:paths = split(&rtp, ",")
    let l:bindingList = []
    for l:path in l:paths
        let l:path .= '/' . s:configurationFileName
        if filereadable(l:path)
            let l:fileContent = readfile(l:path)
            let l:bindingList += l:fileContent
        endif
    endfor
    return l:bindingList
endfunction


