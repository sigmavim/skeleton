"          _                                  __        __     __
"    _____(_)___ _____ ___  ____ _      _____/ /_____  / /__  / /_____  ____
"   / ___/ / __ `/ __ `__ \/ __ `/_____/ ___/ //_/ _ \/ / _ \/ __/ __ \/ __ \
"  (__  ) / /_/ / / / / / / /_/ /_____(__  ) ,< /  __/ /  __/ /_/ /_/ / / / /
" /____/_/\__, /_/ /_/ /_/\__,_/     /____/_/|_|\___/_/\___/\__/\____/_/ /_/
"        /____/
" autoload/skeleton.vim

function! skeleton#load(file_path)
    if a:file_path != '' && (!filereadable(a:file_path) || (g:sigma_skeleton_fill == 1 && getfsize(a:file_path) < 1))
        let s:file_name = split(a:file_path, '/')[-1]
        let s:file_dir = split(a:file_path, '/')[-2]
        let s:file_ext = split(s:file_name, '\.')[-1]
        let s:template_path = expand(g:sigma_skeleton_dir .. '/' .. s:file_name)
        let s:template_by_dir = expand(g:sigma_skeleton_dir .. '/' .. s:file_dir .. '/skel.' .. s:file_ext)
        let s:template_default = expand(g:sigma_skeleton_dir .. '/skel.' .. s:file_ext)

        if filereadable(s:template_path)
            execute '0read ' .. s:template_path
        elseif filereadable(s:template_by_dir)
            execute '0read ' .. s:template_by_dir
        elseif filereadable(s:template_default)
            execute '0read ' .. s:template_default
        endif
    endif
endfunction

