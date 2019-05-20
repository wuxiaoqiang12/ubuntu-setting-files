$pdf_mode = 5;
 
$pdflatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";

$xdvipdfmx = "xdvipdfmx -E -o %D %O %S";
 
$bibtex_use = 1.5;
$out_dir = "latex.out";
$preview_mode = 1;
 
#$clean_ext = "hd nav snm synctex.gz xdv";
 
add_cus_dep('glo', 'gls', 0, 'glo2gls');
sub glo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
push @generated_exts, "glo", "gls";
 
add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
sub nlo2nls {
    system("makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"");
}
push @generated_exts, "nlo", "nls";