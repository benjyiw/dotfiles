function! DetectYamlCloudformation()
   if getline(1) =~ 'AWSTemplateFormatVersion:.*'
     set ft=yaml.cloudformation
   endif
endfunction

function! DetectJsonCloudformation()
   if getline(2) =~ '.*AWSTemplateFormatVersion.*'
     set ft=json.cloudformation
   endif
endfunction

augroup filetypedetect
  au BufRead,BufNewFile *.yaml call DetectYamlCloudformation()
  au BufRead,BufNewFile *.json call DetectJsonCloudformation()
  au FileType yaml call DetectYamlCloudformation()
  au FileType json call DetectYamlCloudformation()
augroup END
