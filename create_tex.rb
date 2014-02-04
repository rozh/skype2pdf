# -*- coding: utf-8 -*-
TITLE = "fugafuga"
AUTHOR = "hogehoge"

header = "\\documentclass[12pt]{article}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{fixltx2e}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{amssymb}
\\usepackage{amstext}
\\usepackage{hyperref}
\\tolerance=1000
\\date{\today}
\\hypersetup{
  pdfkeywords={},
  pdfsubject={},
  pdfcreator={Emacs 24.2.1 (Org mode 8.0.3)}}
\\usepackage[usenames]{color}
"
header += "\\title{" + TITLE + "}
\\author{" + AUTHOR + "}"

doc = "\\begin{document}
\\maketitle"

text = ""
open(ARGV[0] + ".txt"){|file|
  pre_name = ""
  while l = file.gets
    s = l.index("] ")
    e = l.index(": ")
    if s==nil || e==nil
      text += l + "\n\n"
      next
    end
    current_name = l[s+1..e-1]
    if current_name == pre_name
      text += l[e+1...l.length]
    else
      text += l + "\n\n"
    end
    pre_name = current_name
  end
}

text.gsub!("[", "\n　\n\n[")
text.gsub!(": ", ":\n\n")
print text

doc += text

doc += "\\begin{center}
{\\Large 〜" + TITLE + " END〜}
\\end{center}
\\end{document}"


f = File.open(ARGV[0] + ".tex", 'w')
f.puts header + doc
f.close
