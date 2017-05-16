if exists("did_load_filetypes")
  finish
endif

"myfiletypefile 
augroup filetypedetect 
autocmd BufRead,BufNewFile *.ocn                  setfiletype ocean
autocmd BufRead,BufNewFile *.dctl                 setfiletype dctl
autocmd BufRead,BufNewFile *.pt                   setfiletype pt
autocmd BufRead,BufNewFile *.rctcl                setfiletype rctcl 
autocmd BufRead,BufNewFile *.dc,*.synopsys        setfiletype synopsys
autocmd BufNewFile,BufRead cds*.lib,assura*.lib   setfiletype cdslib

autocmd BufRead */spectre/schematic/netlist/netlist  setf spectre
autocmd BufRead,BufNewFile * if getline(2) =~ '^\/\{2}\sLibrary\sname:' && getline(3) =~ '^\/\{2}\sCell\sname:' && getline(4) =~ '^\/\{2}\sView\sname:'|setf spectre|endif

augroup END
