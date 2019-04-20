" vim插件 
" https://linux.cn/article-9416-1.html
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" ~/.vimrc 
" https://blog.csdn.net/amoscykl/article/details/80616688

set tabstop=4           " 1 tab == 4空格
set shiftwidth=4        " << >> == 来调整缩进时4空格
set expandtab           " 空格代替制表符; 仅在输入空格时
set softtabstop=4       " 4空格替代 


"set number             " 行号
set relativenumber      " 相对行号 set nornu                                                                                                                                                                                                                               
set ruler               " 打开状态栏标尺
set cursorline          " 突出显示当前行

set textwidth=80        " 行宽
set wrap                " 自动换行
set linebreak           " 换行不拆分字符

set hlsearch


set showcmd             " 显示中间命令
set noerrorbells        " 去掉输入错误的提示声音

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn


" https://dadoneo.iteye.com/blog/984950
" " 无桌面的一般无+
" " 使用set nonu
"" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key


" @TODO
" 折叠设置

