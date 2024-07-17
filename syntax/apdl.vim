" Vim syntax file
" Language:		APDL
" Creator:	Manfred Spraul <manfred@colorfullife.com>
" Maintainer:	Cristóbal Tapia <crtapia at gmail dot com>
" Last Change:	2014 Oct 10
" Version: 0.03
"
" Note: The support for abreviated commands is intentionally missing.
" 	Typical file names are *.ans and *.mac.
"
" TODO:
" * Further parameter tests for bad params
" * line continuations for multiline commands: *msg, *vwrite, etc.
" * test with ansys:
"     whitespaces + labels
"     $ + labels
"     $ + comment
"     $ + multiline commands

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common part for all syntax files:

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Numbers, allowing signs (both -, and +)
" Integer number.
syn match  apdlNumber		display "[+-]\=\<\d\+\>"
" Floating point number.
syn match  apdlFloat		display "[+-]\=\<\d\+\.\d+\>"
" Floating point number, starting with a dot.
syn match  apdlFloat		display "[+-]\=\<.\d+\>"
syn case ignore
"floating point number, with dot, optional exponent
syn match  apdlFloat	display "\<\d\+\.\d*\(e[-+]\=\d\+\)\=\>"
"floating point number, starting with a dot, optional exponent
syn match  apdlFloat	display "\.\d\+\(e[-+]\=\d\+\)\=\>"
"floating point number, without dot, with exponent
syn match  apdlFloat	display "\<\d\+e[-+]\=\d\+\>"
" Floating point like number with E and no decimal point (+,-)
syn match apdlFloat  display "[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+"
syn match apdlFloat  display "\d[[:digit:]]*[eE][\-+]\=\d\+"
" Floating point like number with E and decimal point (+,-)
syn match apdlFloat  display "[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+"
syn match apdlFloat  display "\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+"
syn case match

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strings, delimited by either " or '
syn case ignore

syn match  apdlString		display "\v\"[^"]*\"" contains=apdlParameterSubstitution
syn match  apdlString		display "\v'[^']*'" contains=apdlParameterSubstitution
" syn region apdlString start=/\v"/ end=/\v"/
" syn region apdlString start=/\v'/ end=/\v'/

syn case match

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APDL specific part:
syn case ignore

" apdl commands found in 'get function summary'
syn   match   apdlGetFunction   display   "\v<nsel\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<esel\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ksel\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<lsel\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<asel\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<vsel\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ndnext\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<elnext\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<kpnext\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<lsnext\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<arnext\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<vlnext\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<centrx\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<centry\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<centrz\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<nx\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ny\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<nz\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<kx\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ky\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<kz\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<lx\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ly\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<lz\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<kp\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<node\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<distnd\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<distkp\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<disten\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<anglen\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<anglek\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<nnear\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<knear\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<enearn\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<areand\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<areakp\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<arnode\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<normnx\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<normny\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<normnz\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<normkx\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<normky\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<normkz\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<enextn\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<nelem\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<nodedof\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<eladj\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ndface\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<nmface\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<arface\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ux\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<uy\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<uz\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<rotx\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<roty\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<rotz\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<temp\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<pres\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<vx\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<vy\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<vz\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<enke\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ends\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<volt\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<mag\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ax\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<ay\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<az\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<virtinqr\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<kwget\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<valchr\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<valoct\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<valhex\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<chrval\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<chroct\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<chrhex\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<strsub\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<strcat\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<strfill\ze\(([^,]*,){2}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<strcomp\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<strleft\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<strpos\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<strleng\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<upcase\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<lwcase\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<join\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlGetFunction   display   "\v<split\ze\(([^,]*,){1}[^,]*\)"

" apdl commands found in 'parametric functions'
syn   match   apdlParametricFunction   display   "\v<abs\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<sign\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<cxabs\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<exp\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<log\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<log10\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<sqrt\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<nint\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<mod\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<rand\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<gdis\ze\(([^,]*,){1}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<sin\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<cos\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<tan\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<sinh\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<cosh\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<tanh\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<asin\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<acos\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<atan\ze\(([^,]*,){0}[^,]*\)"
syn   match   apdlParametricFunction   display   "\v<atan2\ze\(([^,]*,){1}[^,]*\)"

" normal apdl commands
" autoextracted from a few files of the ANSYS 15 html documentation
syn   match 	 apdlFunction   display   "\*create\>"       contained
syn   match 	 apdlFunction   display   "\*end\>"          contained
syn   match    apdlFunction   display   "/anfile\>"        contained
syn   match    apdlFunction   display   "/assign\>"        contained
syn   match    apdlFunction   display   "/batch\>"         contained
syn   match    apdlFunction   display   "/clear\>"         contained
syn   match    apdlFunction   display   "/clog\>"          contained
syn   match    apdlFunction   display   "/com\>"           contained " move this elsewhere, comment
syn   match    apdlFunction   display   "/config\>"        contained
syn   match    apdlFunction   display   "/copy\>"          contained
syn   match    apdlFunction   display   "/cwd\>"           contained
syn   match    apdlFunction   display   "/delete\>"        contained
syn   match    apdlFunction   display   "/dflab\>"         contained
syn   match    apdlFunction   display   "/directory\>"     contained
syn   match    apdlFunction   display   "/fdele\>"         contained
syn   match    apdlFunction   display   "/filname\>"       contained
syn   match    apdlFunction   display   "/format\>"        contained
syn   match    apdlFunction   display   "/go\>"            contained
syn   match    apdlFunction   display   "/golist\>"        contained
syn   match    apdlFunction   display   "/gopr\>"          contained
syn   match    apdlFunction   display   "/gst\>"           contained
syn   match    apdlFunction   display   "/header\>"        contained
syn   match    apdlFunction   display   "/icscale\>"       contained
syn   match    apdlFunction   display   "/input\>"         contained
syn   match    apdlFunction   display   "/inquire\>"       contained
syn   match    apdlFunction   display   "/mail\>"          contained
syn   match    apdlFunction   display   "/map\>"           contained
syn   match    apdlFunction   display   "/menu\>"          contained
syn   match    apdlFunction   display   "/mkdir\>"         contained
syn   match    apdlFunction   display   "/mplib\>"         contained
syn   match    apdlFunction   display   "/mstart\>"        contained
syn   match    apdlFunction   display   "/nerr\>"          contained
syn   match    apdlFunction   display   "/nolist\>"        contained
syn   match    apdlFunction   display   "/nopr\>"          contained
syn   match    apdlFunction   display   "/output\>"        contained
syn   match    apdlFunction   display   "/page\>"          contained
syn   match    apdlFunction   display   "/pds\>"           contained " processor?
syn   match    apdlFunction   display   "/pmacro\>"        contained
syn   match    apdlFunction   display   "/psearch\>"       contained
syn   match    apdlFunction   display   "/rename\>"        contained
syn   match    apdlFunction   display   "/rmdir\>"         contained
syn   match    apdlFunction   display   "/seclib\>"        contained
syn   match    apdlFunction   display   "/status\>"        contained
syn   match    apdlFunction   display   "/stitle\>"        contained
syn   match    apdlFunction   display   "/syp\>"           contained
syn   match    apdlFunction   display   "/sys\>"           contained
syn   match    apdlFunction   display   "/tee\>"           contained
syn   match    apdlFunction   display   "/title\>"         contained
syn   match    apdlFunction   display   "/ucmd\>"          contained
syn   match    apdlFunction   display   "/ui\>"            contained
syn   match    apdlFunction   display   "/uis\>"           contained
syn   match    apdlFunction   display   "/units\>"         contained
syn   match    apdlFunction   display   "/wait\>"          contained
syn   match    apdlFunction   display   "\*abbr\>"         contained
syn   match    apdlFunction   display   "\*afun\>"         contained
syn   match    apdlFunction   display   "\*ask\>"          contained
syn   match    apdlFunction   display   "\*axpy\>"         contained
syn   match    apdlFunction   display   "\*cfclos\>"       contained
syn   match    apdlFunction   display   "\*cfopen\>"       contained
syn   match    apdlFunction   display   "\*cfwrite\>"      contained
syn   match    apdlFunction   display   "\*comp\>"         contained
syn   match    apdlFunction   display   "\*del\>"          contained
syn   match    apdlFunction   display   "\*dim\>"          contained
syn   match    apdlFunction   display   "\*dmat\>"         contained
syn   match    apdlFunction   display   "\*dot\>"          contained
syn   match    apdlFunction   display   "\*eigen\>"        contained
syn   match    apdlFunction   display   "\*exit\>"         contained
syn   match    apdlFunction   display   "\*export\>"       contained
syn   match    apdlFunction   display   "\*fft\>"          contained
syn   match    apdlFunction   display   "\*free\>"         contained
syn   match    apdlFunction   display   "\*get\>"          contained
syn   match    apdlFunction   display   "\*init\>"         contained
syn   match    apdlFunction   display   "\*itengine\>"     contained
syn   match    apdlFunction   display   "\*list\>"         contained
syn   match    apdlFunction   display   "\*lsbac\>"        contained
syn   match    apdlFunction   display   "\*lsdump\>"       contained
syn   match    apdlFunction   display   "\*lsengine\>"     contained
syn   match    apdlFunction   display   "\*lsfactor\>"     contained
syn   match    apdlFunction   display   "\*lsrestore\>"    contained
syn   match    apdlFunction   display   "\*mfouri\>"       contained
syn   match    apdlFunction   display   "\*mfun\>"         contained
syn   match    apdlFunction   display   "\*moper\>"        contained
syn   match    apdlFunction   display   "\*mult\>"         contained
syn   match    apdlFunction   display   "\*nrm\>"          contained
syn   match    apdlFunction   display   "\*print\>"        contained
syn   match    apdlFunction   display   "\*return\>"       contained
syn   match    apdlFunction   display   "\*set\>"          contained
syn   match    apdlFunction   display   "\*smat\>"         contained
syn   match    apdlFunction   display   "\*sread\>"        contained
syn   match    apdlFunction   display   "\*status\>"       contained
syn   match    apdlFunction   display   "\*taxis\>"        contained
syn   match    apdlFunction   display   "\*toper\>"        contained
syn   match    apdlFunction   display   "\*tread\>"        contained
syn   match    apdlFunction   display   "\*ulib\>"         contained
syn   match    apdlFunction   display   "\*use\>"          contained
syn   match    apdlFunction   display   "\*vabs\>"         contained
syn   match    apdlFunction   display   "\*vcol\>"         contained
syn   match    apdlFunction   display   "\*vcum\>"         contained
syn   match    apdlFunction   display   "\*vec\>"          contained
syn   match    apdlFunction   display   "\*vedit\>"        contained
syn   match    apdlFunction   display   "\*vfact\>"        contained
syn   match    apdlFunction   display   "\*vfill\>"        contained
syn   match    apdlFunction   display   "\*vfun\>"         contained
syn   match    apdlFunction   display   "\*vget\>"         contained
syn   match    apdlFunction   display   "\*vitrp\>"        contained
syn   match    apdlFunction   display   "\*vlen\>"         contained
syn   match    apdlFunction   display   "\*vmask\>"        contained
syn   match    apdlFunction   display   "\*voper\>"        contained
syn   match    apdlFunction   display   "\*vplot\>"        contained
syn   match    apdlFunction   display   "\*vput\>"         contained
syn   match    apdlFunction   display   "\*vscfun\>"       contained
syn   match    apdlFunction   display   "\*vstat\>"        contained
syn   match    apdlFunction   display   "\*wrk\>"          contained
syn   match    apdlFunction   display   "\~cat5in\>"       contained
syn   match    apdlFunction   display   "\~catiain\>"      contained
syn   match    apdlFunction   display   "\~parain\>"       contained
syn   match    apdlFunction   display   "\~proein\>"       contained
syn   match    apdlFunction   display   "\~satin\>"        contained
syn   match    apdlFunction   display   "\~ugin\>"         contained
syn   match    apdlFunction   display   "a\>"              contained
syn   match    apdlFunction   display   "aadd\>"           contained
syn   match    apdlFunction   display   "aatt\>"           contained
syn   match    apdlFunction   display   "abbres\>"         contained
syn   match    apdlFunction   display   "abbsav\>"         contained
syn   match    apdlFunction   display   "abextract\>"      contained
syn   match    apdlFunction   display   "abs\>"            contained
syn   match    apdlFunction   display   "accat\>"          contained
syn   match    apdlFunction   display   "accoption\>"      contained
syn   match    apdlFunction   display   "acel\>"           contained
syn   match    apdlFunction   display   "aclear\>"         contained
syn   match    apdlFunction   display   "adams\>"          contained
syn   match    apdlFunction   display   "adapt\>"          contained
syn   match    apdlFunction   display   "add\>"            contained
syn   match    apdlFunction   display   "addam\>"          contained
syn   match    apdlFunction   display   "adele\>"          contained
syn   match    apdlFunction   display   "adgl\>"           contained
syn   match    apdlFunction   display   "adrag\>"          contained
syn   match    apdlFunction   display   "aesize\>"         contained
syn   match    apdlFunction   display   "afillt\>"         contained
syn   match    apdlFunction   display   "aflist\>"         contained
syn   match    apdlFunction   display   "afsurf\>"         contained
syn   match    apdlFunction   display   "agen\>"           contained
syn   match    apdlFunction   display   "aglue\>"          contained
syn   match    apdlFunction   display   "aina\>"           contained
syn   match    apdlFunction   display   "ainp\>"           contained
syn   match    apdlFunction   display   "ainv\>"           contained
syn   match    apdlFunction   display   "al\>"             contained
syn   match    apdlFunction   display   "alist\>"          contained
syn   match    apdlFunction   display   "alphad\>"         contained
syn   match    apdlFunction   display   "amap\>"           contained
syn   match    apdlFunction   display   "amesh\>"          contained
syn   match    apdlFunction   display   "ancntr\>"         contained
syn   match    apdlFunction   display   "ancut\>"          contained
syn   match    apdlFunction   display   "ancyc\>"          contained
syn   match    apdlFunction   display   "andata\>"         contained
syn   match    apdlFunction   display   "andscl\>"         contained
syn   match    apdlFunction   display   "andyna\>"         contained
syn   match    apdlFunction   display   "anflow\>"         contained
syn   match    apdlFunction   display   "anharm\>"         contained
syn   match    apdlFunction   display   "anim\>"           contained
syn   match    apdlFunction   display   "anisos\>"         contained
syn   match    apdlFunction   display   "anmode\>"         contained
syn   match    apdlFunction   display   "anmres\>"         contained
syn   match    apdlFunction   display   "anorm\>"          contained
syn   match    apdlFunction   display   "ansol\>"          contained
syn   match    apdlFunction   display   "anstoaqwa\>"      contained
syn   match    apdlFunction   display   "anstoasas\>"      contained
syn   match    apdlFunction   display   "antime\>"         contained
syn   match    apdlFunction   display   "antype\>"         contained
syn   match    apdlFunction   display   "aoffst\>"         contained
syn   match    apdlFunction   display   "aovlap\>"         contained
syn   match    apdlFunction   display   "aplot\>"          contained
syn   match    apdlFunction   display   "append\>"         contained
syn   match    apdlFunction   display   "aptn\>"           contained
syn   match    apdlFunction   display   "arclen\>"         contained
syn   match    apdlFunction   display   "arctrm\>"         contained
syn   match    apdlFunction   display   "areas\>"          contained
syn   match    apdlFunction   display   "arefine\>"        contained
syn   match    apdlFunction   display   "aremesh\>"        contained
syn   match    apdlFunction   display   "areverse\>"       contained
syn   match    apdlFunction   display   "arotat\>"         contained
syn   match    apdlFunction   display   "arscale\>"        contained
syn   match    apdlFunction   display   "arsym\>"          contained
syn   match    apdlFunction   display   "asba\>"           contained
syn   match    apdlFunction   display   "asbl\>"           contained
syn   match    apdlFunction   display   "asbv\>"           contained
syn   match    apdlFunction   display   "asbw\>"           contained
syn   match    apdlFunction   display   "ascres\>"         contained
syn   match    apdlFunction   display   "asifile\>"        contained
syn   match    apdlFunction   display   "askin\>"          contained
syn   match    apdlFunction   display   "asol\>"           contained
syn   match    apdlFunction   display   "asub\>"           contained
syn   match    apdlFunction   display   "asum\>"           contained
syn   match    apdlFunction   display   "atan\>"           contained
syn   match    apdlFunction   display   "atran\>"          contained
syn   match    apdlFunction   display   "atype\>"          contained
syn   match    apdlFunction   display   "autots\>"         contained
syn   match    apdlFunction   display   "avprin\>"         contained
syn   match    apdlFunction   display   "avres\>"          contained
syn   match    apdlFunction   display   "awave\>"          contained
syn   match    apdlFunction   display   "bcsoption\>"      contained
syn   match    apdlFunction   display   "betad\>"          contained
syn   match    apdlFunction   display   "bf\>"             contained
syn   match    apdlFunction   display   "bfa\>"            contained
syn   match    apdlFunction   display   "bfadele\>"        contained
syn   match    apdlFunction   display   "bfalist\>"        contained
syn   match    apdlFunction   display   "bfcum\>"          contained
syn   match    apdlFunction   display   "bfdele\>"         contained
syn   match    apdlFunction   display   "bfe\>"            contained
syn   match    apdlFunction   display   "bfecum\>"         contained
syn   match    apdlFunction   display   "bfedele\>"        contained
syn   match    apdlFunction   display   "bfelist\>"        contained
syn   match    apdlFunction   display   "bfescal\>"        contained
syn   match    apdlFunction   display   "bfint\>"          contained
syn   match    apdlFunction   display   "bfk\>"            contained
syn   match    apdlFunction   display   "bfkdele\>"        contained
syn   match    apdlFunction   display   "bfklist\>"        contained
syn   match    apdlFunction   display   "bfl\>"            contained
syn   match    apdlFunction   display   "bfldele\>"        contained
syn   match    apdlFunction   display   "bflist\>"         contained
syn   match    apdlFunction   display   "bfllist\>"        contained
syn   match    apdlFunction   display   "bfscale\>"        contained
syn   match    apdlFunction   display   "bftran\>"         contained
syn   match    apdlFunction   display   "bfunif\>"         contained
syn   match    apdlFunction   display   "bfv\>"            contained
syn   match    apdlFunction   display   "bfvdele\>"        contained
syn   match    apdlFunction   display   "bfvlist\>"        contained
syn   match    apdlFunction   display   "bioopt\>"         contained
syn   match    apdlFunction   display   "biot\>"           contained
syn   match    apdlFunction   display   "blc4\>"           contained
syn   match    apdlFunction   display   "blc5\>"           contained
syn   match    apdlFunction   display   "block\>"          contained
syn   match    apdlFunction   display   "bool\>"           contained
syn   match    apdlFunction   display   "boptn\>"          contained
syn   match    apdlFunction   display   "bsax\>"           contained
syn   match    apdlFunction   display   "bsm1\>"           contained
syn   match    apdlFunction   display   "bsm2\>"           contained
syn   match    apdlFunction   display   "bsmd\>"           contained
syn   match    apdlFunction   display   "bsplin\>"         contained
syn   match    apdlFunction   display   "bss1\>"           contained
syn   match    apdlFunction   display   "bss2\>"           contained
syn   match    apdlFunction   display   "bste\>"           contained
syn   match    apdlFunction   display   "bstq\>"           contained
syn   match    apdlFunction   display   "btol\>"           contained
syn   match    apdlFunction   display   "bucopt\>"         contained
syn   match    apdlFunction   display   "c\*\*\*\>"        contained " move this elsewhere, special comment
syn   match    apdlFunction   display   "calc\>"           contained
syn   match    apdlFunction   display   "campbell\>"       contained
syn   match    apdlFunction   display   "cbdof\>"          contained
syn   match    apdlFunction   display   "cbmd\>"           contained
syn   match    apdlFunction   display   "cbmx\>"           contained
syn   match    apdlFunction   display   "cbte\>"           contained
syn   match    apdlFunction   display   "cbtmp\>"          contained
syn   match    apdlFunction   display   "cdopt\>"          contained
syn   match    apdlFunction   display   "cdread\>"         contained
syn   match    apdlFunction   display   "cdwrite\>"        contained
syn   match    apdlFunction   display   "ce\>"             contained
syn   match    apdlFunction   display   "cecheck\>"        contained
syn   match    apdlFunction   display   "cecmod\>"         contained
syn   match    apdlFunction   display   "cecyc\>"          contained
syn   match    apdlFunction   display   "cedele\>"         contained
syn   match    apdlFunction   display   "ceintf\>"         contained
syn   match    apdlFunction   display   "celist\>"         contained
syn   match    apdlFunction   display   "center\>"         contained
syn   match    apdlFunction   display   "ceqn\>"           contained
syn   match    apdlFunction   display   "cerig\>"          contained
syn   match    apdlFunction   display   "cesgen\>"         contained
syn   match    apdlFunction   display   "cfact\>"          contained
syn   match    apdlFunction   display   "cgloc\>"          contained
syn   match    apdlFunction   display   "cgomga\>"         contained
syn   match    apdlFunction   display   "cgrow\>"          contained
syn   match    apdlFunction   display   "check\>"          contained
syn   match    apdlFunction   display   "chkmsh\>"         contained
syn   match    apdlFunction   display   "cint\>"           contained
syn   match    apdlFunction   display   "circle\>"         contained
syn   match    apdlFunction   display   "cisol\>"          contained
syn   match    apdlFunction   display   "clocal\>"         contained
syn   match    apdlFunction   display   "clog\>"           contained
syn   match    apdlFunction   display   "clrmshln\>"       contained
syn   match    apdlFunction   display   "cmacel\>"         contained
syn   match    apdlFunction   display   "cmatrix\>"        contained
syn   match    apdlFunction   display   "cmdomega\>"       contained
syn   match    apdlFunction   display   "cmomega\>"        contained
syn   match    apdlFunction   display   "cmrotate\>"       contained
syn   match    apdlFunction   display   "cmsfile\>"        contained
syn   match    apdlFunction   display   "cmsopt\>"         contained
syn   match    apdlFunction   display   "cncheck\>"        contained
syn   match    apdlFunction   display   "cnkmod\>"         contained
syn   match    apdlFunction   display   "cntr\>"           contained
syn   match    apdlFunction   display   "cnvtol\>"         contained
syn   match    apdlFunction   display   "combine\>"        contained
syn   match    apdlFunction   display   "compress\>"       contained
syn   match    apdlFunction   display   "con4\>"           contained
syn   match    apdlFunction   display   "cone\>"           contained
syn   match    apdlFunction   display   "conjug\>"         contained
syn   match    apdlFunction   display   "coriolis\>"       contained
syn   match    apdlFunction   display   "couple\>"         contained
syn   match    apdlFunction   display   "coval\>"          contained
syn   match    apdlFunction   display   "cp\>"             contained
syn   match    apdlFunction   display   "cpcyc\>"          contained
syn   match    apdlFunction   display   "cpdele\>"         contained
syn   match    apdlFunction   display   "cpintf\>"         contained
syn   match    apdlFunction   display   "cplgen\>"         contained
syn   match    apdlFunction   display   "cplist\>"         contained
syn   match    apdlFunction   display   "cpmerge\>"        contained
syn   match    apdlFunction   display   "cpngen\>"         contained
syn   match    apdlFunction   display   "cpsgen\>"         contained
syn   match    apdlFunction   display   "cqc\>"            contained
syn   match    apdlFunction   display   "crplim\>"         contained
syn   match    apdlFunction   display   "cs\>"             contained
syn   match    apdlFunction   display   "cscir\>"          contained
syn   match    apdlFunction   display   "csdele\>"         contained
syn   match    apdlFunction   display   "cskp\>"           contained
syn   match    apdlFunction   display   "cslist\>"         contained
syn   match    apdlFunction   display   "cswpla\>"         contained
syn   match    apdlFunction   display   "csys\>"           contained
syn   match    apdlFunction   display   "curr2d\>"         contained
syn   match    apdlFunction   display   "cutcontrol\>"     contained
syn   match    apdlFunction   display   "cvar\>"           contained
syn   match    apdlFunction   display   "cycfiles\>"       contained
syn   match    apdlFunction   display   "cycfreq\>"        contained
syn   match    apdlFunction   display   "cyclic\>"         contained
syn   match    apdlFunction   display   "cycopt\>"         contained
syn   match    apdlFunction   display   "cycphase\>"       contained
syn   match    apdlFunction   display   "cyl4\>"           contained
syn   match    apdlFunction   display   "cyl5\>"           contained
syn   match    apdlFunction   display   "cylind\>"         contained
syn   match    apdlFunction   display   "czdel\>"          contained
syn   match    apdlFunction   display   "czmesh\>"         contained
syn   match    apdlFunction   display   "d\>"              contained
syn   match    apdlFunction   display   "da\>"             contained
syn   match    apdlFunction   display   "dadele\>"         contained
syn   match    apdlFunction   display   "dalist\>"         contained
syn   match    apdlFunction   display   "damorph\>"        contained
syn   match    apdlFunction   display   "data\>"           contained
syn   match    apdlFunction   display   "datadef\>"        contained
syn   match    apdlFunction   display   "dcgomg\>"         contained
syn   match    apdlFunction   display   "dcum\>"           contained
syn   match    apdlFunction   display   "dcvswp\>"         contained
syn   match    apdlFunction   display   "ddele\>"          contained
syn   match    apdlFunction   display   "ddoption\>"       contained
syn   match    apdlFunction   display   "deact\>"          contained
syn   match    apdlFunction   display   "define\>"         contained
syn   match    apdlFunction   display   "delete\>"         contained
syn   match    apdlFunction   display   "deltim\>"         contained
syn   match    apdlFunction   display   "demorph\>"        contained
syn   match    apdlFunction   display   "deriv\>"          contained
syn   match    apdlFunction   display   "desize\>"         contained
syn   match    apdlFunction   display   "desol\>"          contained
syn   match    apdlFunction   display   "detab\>"          contained
syn   match    apdlFunction   display   "dflx\>"           contained
syn   match    apdlFunction   display   "dig\>"            contained
syn   match    apdlFunction   display   "digit\>"          contained
syn   match    apdlFunction   display   "display\>"        contained
syn   match    apdlFunction   display   "dj\>"             contained
syn   match    apdlFunction   display   "djdele\>"         contained
syn   match    apdlFunction   display   "djlist\>"         contained
syn   match    apdlFunction   display   "dk\>"             contained
syn   match    apdlFunction   display   "dkdele\>"         contained
syn   match    apdlFunction   display   "dklist\>"         contained
syn   match    apdlFunction   display   "dl\>"             contained
syn   match    apdlFunction   display   "dldele\>"         contained
syn   match    apdlFunction   display   "dlist\>"          contained
syn   match    apdlFunction   display   "dllist\>"         contained
syn   match    apdlFunction   display   "dmove\>"          contained
syn   match    apdlFunction   display   "dmpext\>"         contained
syn   match    apdlFunction   display   "dmpoption\>"      contained
syn   match    apdlFunction   display   "dmprat\>"         contained
syn   match    apdlFunction   display   "dmpstr\>"         contained
syn   match    apdlFunction   display   "dnsol\>"          contained
syn   match    apdlFunction   display   "dof\>"            contained
syn   match    apdlFunction   display   "domega\>"         contained
syn   match    apdlFunction   display   "dscale\>"         contained
syn   match    apdlFunction   display   "dset\>"           contained
syn   match    apdlFunction   display   "dspoption\>"      contained
syn   match    apdlFunction   display   "dsum\>"           contained
syn   match    apdlFunction   display   "dsurf\>"          contained
syn   match    apdlFunction   display   "dsym\>"           contained
syn   match    apdlFunction   display   "dsys\>"           contained
syn   match    apdlFunction   display   "dtran\>"          contained
syn   match    apdlFunction   display   "dump\>"           contained
syn   match    apdlFunction   display   "dval\>"           contained
syn   match    apdlFunction   display   "dvmorph\>"        contained
syn   match    apdlFunction   display   "dynopt\>"         contained
syn   match    apdlFunction   display   "e\>"              contained
syn   match    apdlFunction   display   "ealive\>"         contained
syn   match    apdlFunction   display   "edadapt\>"        contained
syn   match    apdlFunction   display   "edale\>"          contained
syn   match    apdlFunction   display   "edasmp\>"         contained
syn   match    apdlFunction   display   "edbound\>"        contained
syn   match    apdlFunction   display   "edbvis\>"         contained
syn   match    apdlFunction   display   "edbx\>"           contained
syn   match    apdlFunction   display   "edcadapt\>"       contained
syn   match    apdlFunction   display   "edcgen\>"         contained
syn   match    apdlFunction   display   "edclist\>"        contained
syn   match    apdlFunction   display   "edcmore\>"        contained
syn   match    apdlFunction   display   "edcnstr\>"        contained
syn   match    apdlFunction   display   "edcontact\>"      contained
syn   match    apdlFunction   display   "edcpu\>"          contained
syn   match    apdlFunction   display   "edcrb\>"          contained
syn   match    apdlFunction   display   "edcsc\>"          contained
syn   match    apdlFunction   display   "edcts\>"          contained
syn   match    apdlFunction   display   "edcurve\>"        contained
syn   match    apdlFunction   display   "eddamp\>"         contained
syn   match    apdlFunction   display   "eddbl\>"          contained
syn   match    apdlFunction   display   "eddc\>"           contained
syn   match    apdlFunction   display   "eddrelax\>"       contained
syn   match    apdlFunction   display   "eddump\>"         contained
syn   match    apdlFunction   display   "edele\>"          contained
syn   match    apdlFunction   display   "edenergy\>"       contained
syn   match    apdlFunction   display   "edfplot\>"        contained
syn   match    apdlFunction   display   "edgcale\>"        contained
syn   match    apdlFunction   display   "edhgls\>"         contained
syn   match    apdlFunction   display   "edhist\>"         contained
syn   match    apdlFunction   display   "edhtime\>"        contained
syn   match    apdlFunction   display   "edint\>"          contained
syn   match    apdlFunction   display   "edipart\>"        contained
syn   match    apdlFunction   display   "edis\>"           contained
syn   match    apdlFunction   display   "edlcs\>"          contained
syn   match    apdlFunction   display   "edload\>"         contained
syn   match    apdlFunction   display   "edmp\>"           contained
syn   match    apdlFunction   display   "ednb\>"           contained
syn   match    apdlFunction   display   "edndtsd\>"        contained
syn   match    apdlFunction   display   "ednrot\>"         contained
syn   match    apdlFunction   display   "edopt\>"          contained
syn   match    apdlFunction   display   "edout\>"          contained
syn   match    apdlFunction   display   "edpart\>"         contained
syn   match    apdlFunction   display   "edpc\>"           contained
syn   match    apdlFunction   display   "edpl\>"           contained
syn   match    apdlFunction   display   "edpvel\>"         contained
syn   match    apdlFunction   display   "edrc\>"           contained
syn   match    apdlFunction   display   "edrd\>"           contained
syn   match    apdlFunction   display   "edread\>"         contained
syn   match    apdlFunction   display   "edri\>"           contained
syn   match    apdlFunction   display   "edrst\>"          contained
syn   match    apdlFunction   display   "edrun\>"          contained
syn   match    apdlFunction   display   "edshell\>"        contained
syn   match    apdlFunction   display   "edsolv\>"         contained
syn   match    apdlFunction   display   "edsp\>"           contained
syn   match    apdlFunction   display   "edstart\>"        contained
syn   match    apdlFunction   display   "edterm\>"         contained
syn   match    apdlFunction   display   "edtp\>"           contained
syn   match    apdlFunction   display   "edvel\>"          contained
syn   match    apdlFunction   display   "edweld\>"         contained
syn   match    apdlFunction   display   "edwrite\>"        contained
syn   match    apdlFunction   display   "eextrude\>"       contained
syn   match    apdlFunction   display   "egen\>"           contained
syn   match    apdlFunction   display   "eintf\>"          contained
syn   match    apdlFunction   display   "ekill\>"          contained
syn   match    apdlFunction   display   "elbow\>"          contained
syn   match    apdlFunction   display   "elem\>"           contained
syn   match    apdlFunction   display   "elist\>"          contained
syn   match    apdlFunction   display   "emagerr\>"        contained
syn   match    apdlFunction   display   "ematwrite\>"      contained
syn   match    apdlFunction   display   "emf\>"            contained
syn   match    apdlFunction   display   "emft\>"           contained
syn   match    apdlFunction   display   "emid\>"           contained
syn   match    apdlFunction   display   "emis\>"           contained
syn   match    apdlFunction   display   "emodif\>"         contained
syn   match    apdlFunction   display   "emore\>"          contained
syn   match    apdlFunction   display   "emsym\>"          contained
syn   match    apdlFunction   display   "emtgen\>"         contained
syn   match    apdlFunction   display   "emunit\>"         contained
syn   match    apdlFunction   display   "en\>"             contained
syn   match    apdlFunction   display   "endrelease\>"     contained
syn   match    apdlFunction   display   "enersol\>"        contained
syn   match    apdlFunction   display   "engen\>"          contained
syn   match    apdlFunction   display   "enorm\>"          contained
syn   match    apdlFunction   display   "ensym\>"          contained
syn   match    apdlFunction   display   "eorient\>"        contained
syn   match    apdlFunction   display   "eplot\>"          contained
syn   match    apdlFunction   display   "eqslv\>"          contained
syn   match    apdlFunction   display   "eread\>"          contained
syn   match    apdlFunction   display   "erefine\>"        contained
syn   match    apdlFunction   display   "ereinf\>"         contained
syn   match    apdlFunction   display   "eresx\>"          contained
syn   match    apdlFunction   display   "ernorm\>"         contained
syn   match    apdlFunction   display   "errang\>"         contained
syn   match    apdlFunction   display   "escheck\>"        contained
syn   match    apdlFunction   display   "esize\>"          contained
syn   match    apdlFunction   display   "esol\>"           contained
syn   match    apdlFunction   display   "esort\>"          contained
syn   match    apdlFunction   display   "essolv\>"         contained
syn   match    apdlFunction   display   "estif\>"          contained
syn   match    apdlFunction   display   "esurf\>"          contained
syn   match    apdlFunction   display   "esym\>"           contained
syn   match    apdlFunction   display   "esys\>"           contained
syn   match    apdlFunction   display   "et\>"             contained
syn   match    apdlFunction   display   "etable\>"         contained
syn   match    apdlFunction   display   "etchg\>"          contained
syn   match    apdlFunction   display   "etcontrol\>"      contained
syn   match    apdlFunction   display   "etdele\>"         contained
syn   match    apdlFunction   display   "etlist\>"         contained
syn   match    apdlFunction   display   "etype\>"          contained
syn   match    apdlFunction   display   "eusort\>"         contained
syn   match    apdlFunction   display   "ewrite\>"         contained
syn   match    apdlFunction   display   "exp\>"            contained
syn   match    apdlFunction   display   "expand\>"         contained
syn   match    apdlFunction   display   "expass\>"         contained
syn   match    apdlFunction   display   "exprofile\>"      contained
syn   match    apdlFunction   display   "expsol\>"         contained
syn   match    apdlFunction   display   "extopt\>"         contained
syn   match    apdlFunction   display   "extrem\>"         contained
syn   match    apdlFunction   display   "exunit\>"         contained
syn   match    apdlFunction   display   "f\>"              contained
syn   match    apdlFunction   display   "fatigue\>"        contained
syn   match    apdlFunction   display   "fc\>"             contained
syn   match    apdlFunction   display   "fccheck\>"        contained
syn   match    apdlFunction   display   "fcdele\>"         contained
syn   match    apdlFunction   display   "fclist\>"         contained
syn   match    apdlFunction   display   "fctyp\>"          contained
syn   match    apdlFunction   display   "fcum\>"           contained
syn   match    apdlFunction   display   "fdele\>"          contained
syn   match    apdlFunction   display   "fe\>"             contained
syn   match    apdlFunction   display   "febody\>"         contained
syn   match    apdlFunction   display   "fecons\>"         contained
syn   match    apdlFunction   display   "fefor\>"          contained
syn   match    apdlFunction   display   "felist\>"         contained
syn   match    apdlFunction   display   "fesurf\>"         contained
syn   match    apdlFunction   display   "file\>"           contained
syn   match    apdlFunction   display   "fileaux2\>"       contained
syn   match    apdlFunction   display   "fileaux3\>"       contained
syn   match    apdlFunction   display   "filedisp\>"       contained
syn   match    apdlFunction   display   "fill\>"           contained
syn   match    apdlFunction   display   "filldata\>"       contained
syn   match    apdlFunction   display   "fiplot\>"         contained
syn   match    apdlFunction   display   "fitem\>"          contained
syn   match    apdlFunction   display   "fj\>"             contained
syn   match    apdlFunction   display   "fjdele\>"         contained
syn   match    apdlFunction   display   "fjlist\>"         contained
syn   match    apdlFunction   display   "fk\>"             contained
syn   match    apdlFunction   display   "fkdele\>"         contained
syn   match    apdlFunction   display   "fklist\>"         contained
syn   match    apdlFunction   display   "fl\>"             contained
syn   match    apdlFunction   display   "flist\>"          contained
syn   match    apdlFunction   display   "fllist\>"         contained
syn   match    apdlFunction   display   "flst\>"           contained
syn   match    apdlFunction   display   "fluxv\>"          contained
syn   match    apdlFunction   display   "fmagbc\>"         contained
syn   match    apdlFunction   display   "fmagsum\>"        contained
syn   match    apdlFunction   display   "for2d\>"          contained
syn   match    apdlFunction   display   "force\>"          contained
syn   match    apdlFunction   display   "form\>"           contained
syn   match    apdlFunction   display   "fp\>"             contained
syn   match    apdlFunction   display   "fplist\>"         contained
syn   match    apdlFunction   display   "freq\>"           contained
syn   match    apdlFunction   display   "frqscl\>"         contained
syn   match    apdlFunction   display   "fs\>"             contained
syn   match    apdlFunction   display   "fscale\>"         contained
syn   match    apdlFunction   display   "fsdele\>"         contained
syn   match    apdlFunction   display   "fslist\>"         contained
syn   match    apdlFunction   display   "fsnode\>"         contained
syn   match    apdlFunction   display   "fsplot\>"         contained
syn   match    apdlFunction   display   "fssect\>"         contained
syn   match    apdlFunction   display   "fssparm\>"        contained
syn   match    apdlFunction   display   "fsum\>"           contained
syn   match    apdlFunction   display   "ftcalc\>"         contained
syn   match    apdlFunction   display   "ftran\>"          contained
syn   match    apdlFunction   display   "ftsize\>"         contained
syn   match    apdlFunction   display   "ftwrite\>"        contained
syn   match    apdlFunction   display   "ftype\>"          contained
syn   match    apdlFunction   display   "fvmesh\>"         contained
syn   match    apdlFunction   display   "gap\>"            contained
syn   match    apdlFunction   display   "gapf\>"           contained
syn   match    apdlFunction   display   "gauge\>"          contained
syn   match    apdlFunction   display   "genopt\>"         contained
syn   match    apdlFunction   display   "geom\>"           contained
syn   match    apdlFunction   display   "geometry\>"       contained
syn   match    apdlFunction   display   "gmatrix\>"        contained
syn   match    apdlFunction   display   "gp\>"             contained
syn   match    apdlFunction   display   "gpdele\>"         contained
syn   match    apdlFunction   display   "gplist\>"         contained
syn   match    apdlFunction   display   "gplot\>"          contained
syn   match    apdlFunction   display   "grp\>"            contained
syn   match    apdlFunction   display   "gsbdata\>"        contained
syn   match    apdlFunction   display   "gsgdata\>"        contained
syn   match    apdlFunction   display   "gslist\>"         contained
syn   match    apdlFunction   display   "gssol\>"          contained
syn   match    apdlFunction   display   "gsum\>"           contained
syn   match    apdlFunction   display   "harfrq\>"         contained
syn   match    apdlFunction   display   "hbmat\>"          contained
syn   match    apdlFunction   display   "help\>"           contained
syn   match    apdlFunction   display   "helpdisp\>"       contained
syn   match    apdlFunction   display   "hemiopt\>"        contained
syn   match    apdlFunction   display   "hfang\>"          contained
syn   match    apdlFunction   display   "hfsym\>"          contained
syn   match    apdlFunction   display   "hmagsolv\>"       contained
syn   match    apdlFunction   display   "hpgl\>"           contained
syn   match    apdlFunction   display   "hptcreate\>"      contained
syn   match    apdlFunction   display   "hptdelete\>"      contained
syn   match    apdlFunction   display   "hrcplx\>"         contained
syn   match    apdlFunction   display   "hrexp\>"          contained
syn   match    apdlFunction   display   "hrocean\>"        contained
syn   match    apdlFunction   display   "hropt\>"          contained
syn   match    apdlFunction   display   "hrout\>"          contained
syn   match    apdlFunction   display   "ic\>"             contained
syn   match    apdlFunction   display   "icdele\>"         contained
syn   match    apdlFunction   display   "iclist\>"         contained
syn   match    apdlFunction   display   "igesin\>"         contained
syn   match    apdlFunction   display   "igesout\>"        contained
syn   match    apdlFunction   display   "imagin\>"         contained
syn   match    apdlFunction   display   "imesh\>"          contained
syn   match    apdlFunction   display   "impd\>"           contained
syn   match    apdlFunction   display   "inistate\>"       contained
syn   match    apdlFunction   display   "inres\>"          contained
syn   match    apdlFunction   display   "inrtia\>"         contained
syn   match    apdlFunction   display   "int1\>"           contained
syn   match    apdlFunction   display   "intsrf\>"         contained
syn   match    apdlFunction   display   "ioptn\>"          contained
syn   match    apdlFunction   display   "irlf\>"           contained
syn   match    apdlFunction   display   "irlist\>"         contained
syn   match    apdlFunction   display   "jsol\>"           contained
syn   match    apdlFunction   display   "k\>"              contained
syn   match    apdlFunction   display   "katt\>"           contained
syn   match    apdlFunction   display   "kbc\>"            contained
syn   match    apdlFunction   display   "kbetw\>"          contained
syn   match    apdlFunction   display   "kcalc\>"          contained
syn   match    apdlFunction   display   "kcenter\>"        contained
syn   match    apdlFunction   display   "kclear\>"         contained
syn   match    apdlFunction   display   "kdele\>"          contained
syn   match    apdlFunction   display   "kdist\>"          contained
syn   match    apdlFunction   display   "keep\>"           contained
syn   match    apdlFunction   display   "kesize\>"         contained
syn   match    apdlFunction   display   "keyopt\>"         contained
syn   match    apdlFunction   display   "keypts\>"         contained
syn   match    apdlFunction   display   "keyw\>"           contained
syn   match    apdlFunction   display   "kfill\>"          contained
syn   match    apdlFunction   display   "kgen\>"           contained
syn   match    apdlFunction   display   "kl\>"             contained
syn   match    apdlFunction   display   "klist\>"          contained
syn   match    apdlFunction   display   "kmesh\>"          contained
syn   match    apdlFunction   display   "kmodif\>"         contained
syn   match    apdlFunction   display   "kmove\>"          contained
syn   match    apdlFunction   display   "knode\>"          contained
syn   match    apdlFunction   display   "kplot\>"          contained
syn   match    apdlFunction   display   "kpscale\>"        contained
syn   match    apdlFunction   display   "krefine\>"        contained
syn   match    apdlFunction   display   "kscale\>"         contained
syn   match    apdlFunction   display   "kscon\>"          contained
syn   match    apdlFunction   display   "ksum\>"           contained
syn   match    apdlFunction   display   "ksymm\>"          contained
syn   match    apdlFunction   display   "ktran\>"          contained
syn   match    apdlFunction   display   "kuse\>"           contained
syn   match    apdlFunction   display   "kwpave\>"         contained
syn   match    apdlFunction   display   "kwplan\>"         contained
syn   match    apdlFunction   display   "l2ang\>"          contained
syn   match    apdlFunction   display   "l2tan\>"          contained
syn   match    apdlFunction   display   "l\>"              contained
syn   match    apdlFunction   display   "lang\>"           contained
syn   match    apdlFunction   display   "larc\>"           contained
syn   match    apdlFunction   display   "larea\>"          contained
syn   match    apdlFunction   display   "large\>"          contained
syn   match    apdlFunction   display   "latt\>"           contained
syn   match    apdlFunction   display   "layer\>"          contained
syn   match    apdlFunction   display   "layerp26\>"       contained
syn   match    apdlFunction   display   "laylist\>"        contained
syn   match    apdlFunction   display   "layplot\>"        contained
syn   match    apdlFunction   display   "lcabs\>"          contained
syn   match    apdlFunction   display   "lcase\>"          contained
syn   match    apdlFunction   display   "lccalc\>"         contained
syn   match    apdlFunction   display   "lccat\>"          contained
syn   match    apdlFunction   display   "lcdef\>"          contained
syn   match    apdlFunction   display   "lcfact\>"         contained
syn   match    apdlFunction   display   "lcfile\>"         contained
syn   match    apdlFunction   display   "lclear\>"         contained
syn   match    apdlFunction   display   "lcomb\>"          contained
syn   match    apdlFunction   display   "lcoper\>"         contained
syn   match    apdlFunction   display   "lcsel\>"          contained
syn   match    apdlFunction   display   "lcsl\>"           contained
syn   match    apdlFunction   display   "lcsum\>"          contained
syn   match    apdlFunction   display   "lcwrite\>"        contained
syn   match    apdlFunction   display   "lczero\>"         contained
syn   match    apdlFunction   display   "ldele\>"          contained
syn   match    apdlFunction   display   "ldiv\>"           contained
syn   match    apdlFunction   display   "ldrag\>"          contained
syn   match    apdlFunction   display   "ldread\>"         contained
syn   match    apdlFunction   display   "lesize\>"         contained
syn   match    apdlFunction   display   "lextnd\>"         contained
syn   match    apdlFunction   display   "lfillt\>"         contained
syn   match    apdlFunction   display   "lfsurf\>"         contained
syn   match    apdlFunction   display   "lgen\>"           contained
syn   match    apdlFunction   display   "lglue\>"          contained
syn   match    apdlFunction   display   "lgwrite\>"        contained
syn   match    apdlFunction   display   "lina\>"           contained
syn   match    apdlFunction   display   "line\>"           contained
syn   match    apdlFunction   display   "lines\>"          contained
syn   match    apdlFunction   display   "linl\>"           contained
syn   match    apdlFunction   display   "linp\>"           contained
syn   match    apdlFunction   display   "linv\>"           contained
syn   match    apdlFunction   display   "list\>"           contained
syn   match    apdlFunction   display   "llist\>"          contained
syn   match    apdlFunction   display   "lmatrix\>"        contained
syn   match    apdlFunction   display   "lmesh\>"          contained
syn   match    apdlFunction   display   "lnsrch\>"         contained
syn   match    apdlFunction   display   "local\>"          contained
syn   match    apdlFunction   display   "lovlap\>"         contained
syn   match    apdlFunction   display   "lplot\>"          contained
syn   match    apdlFunction   display   "lptn\>"           contained
syn   match    apdlFunction   display   "lrefine\>"        contained
syn   match    apdlFunction   display   "lreverse\>"       contained
syn   match    apdlFunction   display   "lrotat\>"         contained
syn   match    apdlFunction   display   "lsba\>"           contained
syn   match    apdlFunction   display   "lsbl\>"           contained
syn   match    apdlFunction   display   "lsbv\>"           contained
syn   match    apdlFunction   display   "lsbw\>"           contained
syn   match    apdlFunction   display   "lsclear\>"        contained
syn   match    apdlFunction   display   "lsdele\>"         contained
syn   match    apdlFunction   display   "lsoper\>"         contained
syn   match    apdlFunction   display   "lsread\>"         contained
syn   match    apdlFunction   display   "lsscale\>"        contained
syn   match    apdlFunction   display   "lssolve\>"        contained
syn   match    apdlFunction   display   "lstr\>"           contained
syn   match    apdlFunction   display   "lsum\>"           contained
syn   match    apdlFunction   display   "lswrite\>"        contained
syn   match    apdlFunction   display   "lsymm\>"          contained
syn   match    apdlFunction   display   "ltan\>"           contained
syn   match    apdlFunction   display   "ltran\>"          contained
syn   match    apdlFunction   display   "lumpm\>"          contained
syn   match    apdlFunction   display   "lvscale\>"        contained
syn   match    apdlFunction   display   "lwplan\>"         contained
syn   match    apdlFunction   display   "m\>"              contained
syn   match    apdlFunction   display   "madapt\>"         contained
syn   match    apdlFunction   display   "magopt\>"         contained
syn   match    apdlFunction   display   "magsolv\>"        contained
syn   match    apdlFunction   display   "map2dto3d\>"      contained
syn   match    apdlFunction   display   "map\>"            contained
syn   match    apdlFunction   display   "mapsolve\>"       contained
syn   match    apdlFunction   display   "mapvar\>"         contained
syn   match    apdlFunction   display   "master\>"         contained
syn   match    apdlFunction   display   "mat\>"            contained
syn   match    apdlFunction   display   "mater\>"          contained
syn   match    apdlFunction   display   "mcheck\>"         contained
syn   match    apdlFunction   display   "mdamp\>"          contained
syn   match    apdlFunction   display   "mdele\>"          contained
syn   match    apdlFunction   display   "mdplot\>"         contained
syn   match    apdlFunction   display   "memm\>"           contained
syn   match    apdlFunction   display   "meshing\>"        contained
syn   match    apdlFunction   display   "mfanalysis\>"     contained
syn   match    apdlFunction   display   "mfbucket\>"       contained
syn   match    apdlFunction   display   "mfcalc\>"         contained
syn   match    apdlFunction   display   "mfci\>"           contained
syn   match    apdlFunction   display   "mfclear\>"        contained
syn   match    apdlFunction   display   "mfcmmand\>"       contained
syn   match    apdlFunction   display   "mfconv\>"         contained
syn   match    apdlFunction   display   "mfdtime\>"        contained
syn   match    apdlFunction   display   "mfelem\>"         contained
syn   match    apdlFunction   display   "mfem\>"           contained
syn   match    apdlFunction   display   "mfexter\>"        contained
syn   match    apdlFunction   display   "mffname\>"        contained
syn   match    apdlFunction   display   "mffr\>"           contained
syn   match    apdlFunction   display   "mfimport\>"       contained
syn   match    apdlFunction   display   "mfinter\>"        contained
syn   match    apdlFunction   display   "mfiter\>"         contained
syn   match    apdlFunction   display   "mflcomm\>"        contained
syn   match    apdlFunction   display   "mflist\>"         contained
syn   match    apdlFunction   display   "mfmap\>"          contained
syn   match    apdlFunction   display   "mforder\>"        contained
syn   match    apdlFunction   display   "mfoutput\>"       contained
syn   match    apdlFunction   display   "mfpsimul\>"       contained
syn   match    apdlFunction   display   "mfrc\>"           contained
syn   match    apdlFunction   display   "mfrelax\>"        contained
syn   match    apdlFunction   display   "mfrstart\>"       contained
syn   match    apdlFunction   display   "mfsorder\>"       contained
syn   match    apdlFunction   display   "mfsurface\>"      contained
syn   match    apdlFunction   display   "mftime\>"         contained
syn   match    apdlFunction   display   "mftol\>"          contained
syn   match    apdlFunction   display   "mfvolume\>"       contained
syn   match    apdlFunction   display   "mfwrite\>"        contained
syn   match    apdlFunction   display   "mgen\>"           contained
syn   match    apdlFunction   display   "midtol\>"         contained
syn   match    apdlFunction   display   "mlist\>"          contained
syn   match    apdlFunction   display   "mmass\>"          contained
syn   match    apdlFunction   display   "mmf\>"            contained
syn   match    apdlFunction   display   "modcont\>"        contained
syn   match    apdlFunction   display   "mode\>"           contained
syn   match    apdlFunction   display   "modify\>"         contained
syn   match    apdlFunction   display   "modmsh\>"         contained
syn   match    apdlFunction   display   "modopt\>"         contained
syn   match    apdlFunction   display   "modseloption\>"   contained
syn   match    apdlFunction   display   "monitor\>"        contained
syn   match    apdlFunction   display   "mopt\>"           contained
syn   match    apdlFunction   display   "morph\>"          contained
syn   match    apdlFunction   display   "move\>"           contained
syn   match    apdlFunction   display   "mp\>"             contained
syn   match    apdlFunction   display   "mpamod\>"         contained
syn   match    apdlFunction   display   "mpchg\>"          contained
syn   match    apdlFunction   display   "mpcopy\>"         contained
syn   match    apdlFunction   display   "mpdata\>"         contained
syn   match    apdlFunction   display   "mpdele\>"         contained
syn   match    apdlFunction   display   "mpdres\>"         contained
syn   match    apdlFunction   display   "mplist\>"         contained
syn   match    apdlFunction   display   "mpplot\>"         contained
syn   match    apdlFunction   display   "mpread\>"         contained
syn   match    apdlFunction   display   "mprint\>"         contained
syn   match    apdlFunction   display   "mptemp\>"         contained
syn   match    apdlFunction   display   "mptgen\>"         contained
syn   match    apdlFunction   display   "mptres\>"         contained
syn   match    apdlFunction   display   "mpwrite\>"        contained
syn   match    apdlFunction   display   "msave\>"          contained
syn   match    apdlFunction   display   "mshape\>"         contained
syn   match    apdlFunction   display   "mshcopy\>"        contained
syn   match    apdlFunction   display   "mshkey\>"         contained
syn   match    apdlFunction   display   "mshmid\>"         contained
syn   match    apdlFunction   display   "mshpattern\>"     contained
syn   match    apdlFunction   display   "mstole\>"         contained
syn   match    apdlFunction   display   "mxpand\>"         contained
syn   match    apdlFunction   display   "n\>"              contained
syn   match    apdlFunction   display   "nang\>"           contained
syn   match    apdlFunction   display   "naxis\>"          contained
syn   match    apdlFunction   display   "ncnv\>"           contained
syn   match    apdlFunction   display   "ndele\>"          contained
syn   match    apdlFunction   display   "ndist\>"          contained
syn   match    apdlFunction   display   "ndsurf\>"         contained
syn   match    apdlFunction   display   "neqit\>"          contained
syn   match    apdlFunction   display   "nforce\>"         contained
syn   match    apdlFunction   display   "ngen\>"           contained
syn   match    apdlFunction   display   "nkpt\>"           contained
syn   match    apdlFunction   display   "nladaptive\>"     contained
syn   match    apdlFunction   display   "nldiag\>"         contained
syn   match    apdlFunction   display   "nldpost\>"        contained
syn   match    apdlFunction   display   "nlgeom\>"         contained
syn   match    apdlFunction   display   "nlhist\>"         contained
syn   match    apdlFunction   display   "nlist\>"          contained
syn   match    apdlFunction   display   "nlog\>"           contained
syn   match    apdlFunction   display   "nlopt\>"          contained
syn   match    apdlFunction   display   "nmodif\>"         contained
syn   match    apdlFunction   display   "nocolor\>"        contained
syn   match    apdlFunction   display   "nodes\>"          contained
syn   match    apdlFunction   display   "nooffset\>"       contained
syn   match    apdlFunction   display   "noorder\>"        contained
syn   match    apdlFunction   display   "nora\>"           contained
syn   match    apdlFunction   display   "norl\>"           contained
syn   match    apdlFunction   display   "nplot\>"          contained
syn   match    apdlFunction   display   "nprint\>"         contained
syn   match    apdlFunction   display   "nread\>"          contained
syn   match    apdlFunction   display   "nrefine\>"        contained
syn   match    apdlFunction   display   "nrlsum\>"         contained
syn   match    apdlFunction   display   "nropt\>"          contained
syn   match    apdlFunction   display   "nrotat\>"         contained
syn   match    apdlFunction   display   "nrrang\>"         contained
syn   match    apdlFunction   display   "nscale\>"         contained
syn   match    apdlFunction   display   "nsmooth\>"        contained
syn   match    apdlFunction   display   "nsol\>"           contained
syn   match    apdlFunction   display   "nsort\>"          contained
syn   match    apdlFunction   display   "nstore\>"         contained
syn   match    apdlFunction   display   "nsubst\>"         contained
syn   match    apdlFunction   display   "nsvr\>"           contained
syn   match    apdlFunction   display   "nsym\>"           contained
syn   match    apdlFunction   display   "numcmp\>"         contained
syn   match    apdlFunction   display   "numexp\>"         contained
syn   match    apdlFunction   display   "nummrg\>"         contained
syn   match    apdlFunction   display   "numoff\>"         contained
syn   match    apdlFunction   display   "numstr\>"         contained
syn   match    apdlFunction   display   "numvar\>"         contained
syn   match    apdlFunction   display   "nusort\>"         contained
syn   match    apdlFunction   display   "nwpave\>"         contained
syn   match    apdlFunction   display   "nwplan\>"         contained
syn   match    apdlFunction   display   "nwrite\>"         contained
syn   match    apdlFunction   display   "ocdata\>"         contained
syn   match    apdlFunction   display   "ocdelete\>"       contained
syn   match    apdlFunction   display   "oclist\>"         contained
syn   match    apdlFunction   display   "ocread\>"         contained
syn   match    apdlFunction   display   "octable\>"        contained
syn   match    apdlFunction   display   "octype\>"         contained
syn   match    apdlFunction   display   "oczone\>"         contained
syn   match    apdlFunction   display   "omega\>"          contained
syn   match    apdlFunction   display   "operate\>"        contained
syn   match    apdlFunction   display   "opncontrol\>"     contained
syn   match    apdlFunction   display   "outaero\>"        contained
syn   match    apdlFunction   display   "outopt\>"         contained
syn   match    apdlFunction   display   "outpr\>"          contained
syn   match    apdlFunction   display   "outres\>"         contained
syn   match    apdlFunction   display   "ovcheck\>"        contained
syn   match    apdlFunction   display   "padele\>"         contained
syn   match    apdlFunction   display   "paget\>"          contained
syn   match    apdlFunction   display   "paput\>"          contained
syn   match    apdlFunction   display   "paresu\>"         contained
syn   match    apdlFunction   display   "parres\>"         contained
syn   match    apdlFunction   display   "parsav\>"         contained
syn   match    apdlFunction   display   "pasave\>"         contained
syn   match    apdlFunction   display   "path\>"           contained
syn   match    apdlFunction   display   "pause\>"          contained
syn   match    apdlFunction   display   "pcalc\>"          contained
syn   match    apdlFunction   display   "pcgopt\>"         contained
syn   match    apdlFunction   display   "pcirc\>"          contained
syn   match    apdlFunction   display   "pcross\>"         contained
syn   match    apdlFunction   display   "pdanl\>"          contained
syn   match    apdlFunction   display   "pdcdf\>"          contained
syn   match    apdlFunction   display   "pdcfld\>"         contained
syn   match    apdlFunction   display   "pdclr\>"          contained
syn   match    apdlFunction   display   "pdcmat\>"         contained
syn   match    apdlFunction   display   "pdcorr\>"         contained
syn   match    apdlFunction   display   "pddmcs\>"         contained
syn   match    apdlFunction   display   "pddoel\>"         contained
syn   match    apdlFunction   display   "pdef\>"           contained
syn   match    apdlFunction   display   "pdexe\>"          contained
syn   match    apdlFunction   display   "pdhist\>"         contained
syn   match    apdlFunction   display   "pdinqr\>"         contained
syn   match    apdlFunction   display   "pdlhs\>"          contained
syn   match    apdlFunction   display   "pdmeth\>"         contained
syn   match    apdlFunction   display   "pdot\>"           contained
syn   match    apdlFunction   display   "pdpinv\>"         contained
syn   match    apdlFunction   display   "pdplot\>"         contained
syn   match    apdlFunction   display   "pdprob\>"         contained
syn   match    apdlFunction   display   "pdresu\>"         contained
syn   match    apdlFunction   display   "pdropt\>"         contained
syn   match    apdlFunction   display   "pdsave\>"         contained
syn   match    apdlFunction   display   "pdscat\>"         contained
syn   match    apdlFunction   display   "pdsens\>"         contained
syn   match    apdlFunction   display   "pdshis\>"         contained
syn   match    apdlFunction   display   "pduser\>"         contained
syn   match    apdlFunction   display   "pdvar\>"          contained
syn   match    apdlFunction   display   "pdwrite\>"        contained
syn   match    apdlFunction   display   "perbc2d\>"        contained
syn   match    apdlFunction   display   "perturb\>"        contained
syn   match    apdlFunction   display   "pfact\>"          contained
syn   match    apdlFunction   display   "physics\>"        contained
syn   match    apdlFunction   display   "pilecalc\>"       contained
syn   match    apdlFunction   display   "piledispset\>"    contained
syn   match    apdlFunction   display   "pilegen\>"        contained
syn   match    apdlFunction   display   "pileload\>"       contained
syn   match    apdlFunction   display   "pilemass\>"       contained
syn   match    apdlFunction   display   "pilerun\>"        contained
syn   match    apdlFunction   display   "pilesel\>"        contained
syn   match    apdlFunction   display   "pilestif\>"       contained
syn   match    apdlFunction   display   "pivcheck\>"       contained
syn   match    apdlFunction   display   "plcamp\>"         contained
syn   match    apdlFunction   display   "plcint\>"         contained
syn   match    apdlFunction   display   "plcplx\>"         contained
syn   match    apdlFunction   display   "plcrack\>"        contained
syn   match    apdlFunction   display   "pldisp\>"         contained
syn   match    apdlFunction   display   "plesol\>"         contained
syn   match    apdlFunction   display   "pletab\>"         contained
syn   match    apdlFunction   display   "plf2d\>"          contained
syn   match    apdlFunction   display   "plfar\>"          contained
syn   match    apdlFunction   display   "plgeom\>"         contained
syn   match    apdlFunction   display   "plls\>"           contained
syn   match    apdlFunction   display   "plmap\>"          contained
syn   match    apdlFunction   display   "plnear\>"         contained
syn   match    apdlFunction   display   "plnsol\>"         contained
syn   match    apdlFunction   display   "plorb\>"          contained
syn   match    apdlFunction   display   "plot\>"           contained
syn   match    apdlFunction   display   "plotting\>"       contained
syn   match    apdlFunction   display   "plpagm\>"         contained
syn   match    apdlFunction   display   "plpath\>"         contained
syn   match    apdlFunction   display   "plsect\>"         contained
syn   match    apdlFunction   display   "plst\>"           contained
syn   match    apdlFunction   display   "pltime\>"         contained
syn   match    apdlFunction   display   "pltrac\>"         contained
syn   match    apdlFunction   display   "plvar\>"          contained
syn   match    apdlFunction   display   "plvect\>"         contained
syn   match    apdlFunction   display   "pmap\>"           contained
syn   match    apdlFunction   display   "pmgtran\>"        contained
syn   match    apdlFunction   display   "pmlopt\>"         contained
syn   match    apdlFunction   display   "pmlsize\>"        contained
syn   match    apdlFunction   display   "point\>"          contained
syn   match    apdlFunction   display   "poly\>"           contained
syn   match    apdlFunction   display   "powerh\>"         contained
syn   match    apdlFunction   display   "ppath\>"          contained
syn   match    apdlFunction   display   "prange\>"         contained
syn   match    apdlFunction   display   "prcamp\>"         contained
syn   match    apdlFunction   display   "prcint\>"         contained
syn   match    apdlFunction   display   "prcplx\>"         contained
syn   match    apdlFunction   display   "pred\>"           contained
syn   match    apdlFunction   display   "prenergy\>"       contained
syn   match    apdlFunction   display   "prerr\>"          contained
syn   match    apdlFunction   display   "presol\>"         contained
syn   match    apdlFunction   display   "pretab\>"         contained
syn   match    apdlFunction   display   "prfar\>"          contained
syn   match    apdlFunction   display   "pri2\>"           contained
syn   match    apdlFunction   display   "prim\>"           contained
syn   match    apdlFunction   display   "print\>"          contained
syn   match    apdlFunction   display   "prism\>"          contained
syn   match    apdlFunction   display   "priter\>"         contained
syn   match    apdlFunction   display   "prjsol\>"         contained
syn   match    apdlFunction   display   "prnear\>"         contained
syn   match    apdlFunction   display   "prnld\>"          contained
syn   match    apdlFunction   display   "prnsol\>"         contained
syn   match    apdlFunction   display   "prod\>"           contained
syn   match    apdlFunction   display   "prorb\>"          contained
syn   match    apdlFunction   display   "prpath\>"         contained
syn   match    apdlFunction   display   "prrfor\>"         contained
syn   match    apdlFunction   display   "prrsol\>"         contained
syn   match    apdlFunction   display   "prsect\>"         contained
syn   match    apdlFunction   display   "prtime\>"         contained
syn   match    apdlFunction   display   "prvar\>"          contained
syn   match    apdlFunction   display   "prvect\>"         contained
syn   match    apdlFunction   display   "pscontrol\>"      contained
syn   match    apdlFunction   display   "psdcom\>"         contained
syn   match    apdlFunction   display   "psdfrq\>"         contained
syn   match    apdlFunction   display   "psdgraph\>"       contained
syn   match    apdlFunction   display   "psdres\>"         contained
syn   match    apdlFunction   display   "psdspl\>"         contained
syn   match    apdlFunction   display   "psdunit\>"        contained
syn   match    apdlFunction   display   "psdval\>"         contained
syn   match    apdlFunction   display   "psdwav\>"         contained
syn   match    apdlFunction   display   "psel\>"           contained
syn   match    apdlFunction   display   "psmat\>"          contained
syn   match    apdlFunction   display   "psmesh\>"         contained
syn   match    apdlFunction   display   "pstres\>"         contained
syn   match    apdlFunction   display   "ptr\>"            contained
syn   match    apdlFunction   display   "ptxy\>"           contained
syn   match    apdlFunction   display   "pvect\>"          contained
syn   match    apdlFunction   display   "qdval\>"          contained
syn   match    apdlFunction   display   "qrdopt\>"         contained
syn   match    apdlFunction   display   "qsopt\>"          contained
syn   match    apdlFunction   display   "quad\>"           contained
syn   match    apdlFunction   display   "quot\>"           contained
syn   match    apdlFunction   display   "r\>"              contained
syn   match    apdlFunction   display   "race\>"           contained
syn   match    apdlFunction   display   "radopt\>"         contained
syn   match    apdlFunction   display   "rappnd\>"         contained
syn   match    apdlFunction   display   "rate\>"           contained
syn   match    apdlFunction   display   "rbe3\>"           contained
syn   match    apdlFunction   display   "rcon\>"           contained
syn   match    apdlFunction   display   "rcyc\>"           contained
syn   match    apdlFunction   display   "rdec\>"           contained
syn   match    apdlFunction   display   "rdele\>"          contained
syn   match    apdlFunction   display   "read\>"           contained
syn   match    apdlFunction   display   "real\>"           contained
syn   match    apdlFunction   display   "realvar\>"        contained
syn   match    apdlFunction   display   "rectng\>"         contained
syn   match    apdlFunction   display   "remesh\>"         contained
syn   match    apdlFunction   display   "reorder\>"        contained
syn   match    apdlFunction   display   "rescombine\>"     contained
syn   match    apdlFunction   display   "rescontrol\>"     contained
syn   match    apdlFunction   display   "reset\>"          contained
syn   match    apdlFunction   display   "resp\>"           contained
syn   match    apdlFunction   display   "resume\>"         contained
syn   match    apdlFunction   display   "resvec\>"         contained
syn   match    apdlFunction   display   "reswrite\>"       contained
syn   match    apdlFunction   display   "rexport\>"        contained
syn   match    apdlFunction   display   "rezone\>"         contained
syn   match    apdlFunction   display   "rforce\>"         contained
syn   match    apdlFunction   display   "rigid\>"          contained
syn   match    apdlFunction   display   "rigresp\>"        contained
syn   match    apdlFunction   display   "rimport\>"        contained
syn   match    apdlFunction   display   "rlist\>"          contained
syn   match    apdlFunction   display   "rmalist\>"        contained
syn   match    apdlFunction   display   "rmanl\>"          contained
syn   match    apdlFunction   display   "rmaster\>"        contained
syn   match    apdlFunction   display   "rmcap\>"          contained
syn   match    apdlFunction   display   "rmclist\>"        contained
syn   match    apdlFunction   display   "rmflvec\>"        contained
syn   match    apdlFunction   display   "rmlvscale\>"      contained
syn   match    apdlFunction   display   "rmmlist\>"        contained
syn   match    apdlFunction   display   "rmmrange\>"       contained
syn   match    apdlFunction   display   "rmmselect\>"      contained
syn   match    apdlFunction   display   "rmndisp\>"        contained
syn   match    apdlFunction   display   "rmnevec\>"        contained
syn   match    apdlFunction   display   "rmodif\>"         contained
syn   match    apdlFunction   display   "rmore\>"          contained
syn   match    apdlFunction   display   "rmporder\>"       contained
syn   match    apdlFunction   display   "rmresume\>"       contained
syn   match    apdlFunction   display   "rmrgenerate\>"    contained
syn   match    apdlFunction   display   "rmroptions\>"     contained
syn   match    apdlFunction   display   "rmrplot\>"        contained
syn   match    apdlFunction   display   "rmrstatus\>"      contained
syn   match    apdlFunction   display   "rmsave\>"         contained
syn   match    apdlFunction   display   "rmsmple\>"        contained
syn   match    apdlFunction   display   "rmuse\>"          contained
syn   match    apdlFunction   display   "rmxport\>"        contained
syn   match    apdlFunction   display   "rock\>"           contained
syn   match    apdlFunction   display   "rose\>"           contained
syn   match    apdlFunction   display   "rpoly\>"          contained
syn   match    apdlFunction   display   "rpr4\>"           contained
syn   match    apdlFunction   display   "rprism\>"         contained
syn   match    apdlFunction   display   "rpsd\>"           contained
syn   match    apdlFunction   display   "rsfit\>"          contained
syn   match    apdlFunction   display   "rsopt\>"          contained
syn   match    apdlFunction   display   "rsplit\>"         contained
syn   match    apdlFunction   display   "rsplot\>"         contained
syn   match    apdlFunction   display   "rsprnt\>"         contained
syn   match    apdlFunction   display   "rssims\>"         contained
syn   match    apdlFunction   display   "rstmac\>"         contained
syn   match    apdlFunction   display   "rstoff\>"         contained
syn   match    apdlFunction   display   "rsurf\>"          contained
syn   match    apdlFunction   display   "rsymm\>"          contained
syn   match    apdlFunction   display   "rsys\>"           contained
syn   match    apdlFunction   display   "rthick\>"         contained
syn   match    apdlFunction   display   "sabs\>"           contained
syn   match    apdlFunction   display   "sadd\>"           contained
syn   match    apdlFunction   display   "sallow\>"         contained
syn   match    apdlFunction   display   "save\>"           contained
syn   match    apdlFunction   display   "sbclist\>"        contained
syn   match    apdlFunction   display   "sbctran\>"        contained
syn   match    apdlFunction   display   "sdelete\>"        contained
syn   match    apdlFunction   display   "se\>"             contained
syn   match    apdlFunction   display   "seccontrol\>"     contained
syn   match    apdlFunction   display   "secdata\>"        contained
syn   match    apdlFunction   display   "secfunction\>"    contained
syn   match    apdlFunction   display   "secjoint\>"       contained
syn   match    apdlFunction   display   "seclock\>"        contained
syn   match    apdlFunction   display   "secmodif\>"       contained
syn   match    apdlFunction   display   "secnum\>"         contained
syn   match    apdlFunction   display   "secoffset\>"      contained
syn   match    apdlFunction   display   "secplot\>"        contained
syn   match    apdlFunction   display   "secread\>"        contained
syn   match    apdlFunction   display   "secstop\>"        contained
syn   match    apdlFunction   display   "sectype\>"        contained
syn   match    apdlFunction   display   "secwrite\>"       contained
syn   match    apdlFunction   display   "sed\>"            contained
syn   match    apdlFunction   display   "sedlist\>"        contained
syn   match    apdlFunction   display   "seexp\>"          contained
syn   match    apdlFunction   display   "segen\>"          contained
syn   match    apdlFunction   display   "selist\>"         contained
syn   match    apdlFunction   display   "selm\>"           contained
syn   match    apdlFunction   display   "senergy\>"        contained
syn   match    apdlFunction   display   "seopt\>"          contained
syn   match    apdlFunction   display   "sesymm\>"         contained
syn   match    apdlFunction   display   "set\>"            contained
syn   match    apdlFunction   display   "setfgap\>"        contained
syn   match    apdlFunction   display   "setran\>"         contained
syn   match    apdlFunction   display   "sexp\>"           contained
syn   match    apdlFunction   display   "sf\>"             contained
syn   match    apdlFunction   display   "sfa\>"            contained
syn   match    apdlFunction   display   "sfact\>"          contained
syn   match    apdlFunction   display   "sfadele\>"        contained
syn   match    apdlFunction   display   "sfalist\>"        contained
syn   match    apdlFunction   display   "sfbeam\>"         contained
syn   match    apdlFunction   display   "sfcalc\>"         contained
syn   match    apdlFunction   display   "sfcum\>"          contained
syn   match    apdlFunction   display   "sfdele\>"         contained
syn   match    apdlFunction   display   "sfe\>"            contained
syn   match    apdlFunction   display   "sfedele\>"        contained
syn   match    apdlFunction   display   "sfelist\>"        contained
syn   match    apdlFunction   display   "sffun\>"          contained
syn   match    apdlFunction   display   "sfgrad\>"         contained
syn   match    apdlFunction   display   "sfl\>"            contained
syn   match    apdlFunction   display   "sfldele\>"        contained
syn   match    apdlFunction   display   "sflex\>"          contained
syn   match    apdlFunction   display   "sflist\>"         contained
syn   match    apdlFunction   display   "sfllist\>"        contained
syn   match    apdlFunction   display   "sfscale\>"        contained
syn   match    apdlFunction   display   "sftran\>"         contained
syn   match    apdlFunction   display   "shell\>"          contained
syn   match    apdlFunction   display   "shpp\>"           contained
syn   match    apdlFunction   display   "slist\>"          contained
syn   match    apdlFunction   display   "sload\>"          contained
syn   match    apdlFunction   display   "small\>"          contained
syn   match    apdlFunction   display   "smax\>"           contained
syn   match    apdlFunction   display   "smbody\>"         contained
syn   match    apdlFunction   display   "smcons\>"         contained
syn   match    apdlFunction   display   "smfor\>"          contained
syn   match    apdlFunction   display   "smin\>"           contained
syn   match    apdlFunction   display   "smooth\>"         contained
syn   match    apdlFunction   display   "smrtsize\>"       contained
syn   match    apdlFunction   display   "smsurf\>"         contained
syn   match    apdlFunction   display   "smult\>"          contained
syn   match    apdlFunction   display   "snoption\>"       contained
syn   match    apdlFunction   display   "solcontrol\>"     contained
syn   match    apdlFunction   display   "solu\>"           contained
syn   match    apdlFunction   display   "soluopt\>"        contained
syn   match    apdlFunction   display   "solve\>"          contained
syn   match    apdlFunction   display   "sort\>"           contained
syn   match    apdlFunction   display   "source\>"         contained
syn   match    apdlFunction   display   "space\>"          contained
syn   match    apdlFunction   display   "spcnod\>"         contained
syn   match    apdlFunction   display   "spctemp\>"        contained
syn   match    apdlFunction   display   "spdamp\>"         contained
syn   match    apdlFunction   display   "spec\>"           contained
syn   match    apdlFunction   display   "spfreq\>"         contained
syn   match    apdlFunction   display   "spgraph\>"        contained
syn   match    apdlFunction   display   "sph4\>"           contained
syn   match    apdlFunction   display   "sph5\>"           contained
syn   match    apdlFunction   display   "sphere\>"         contained
syn   match    apdlFunction   display   "spline\>"         contained
syn   match    apdlFunction   display   "splot\>"          contained
syn   match    apdlFunction   display   "spmwrite\>"       contained
syn   match    apdlFunction   display   "spoint\>"         contained
syn   match    apdlFunction   display   "spopt\>"          contained
syn   match    apdlFunction   display   "spower\>"         contained
syn   match    apdlFunction   display   "spread\>"         contained
syn   match    apdlFunction   display   "sptopt\>"         contained
syn   match    apdlFunction   display   "spunit\>"         contained
syn   match    apdlFunction   display   "spval\>"          contained
syn   match    apdlFunction   display   "sqrt\>"           contained
syn   match    apdlFunction   display   "srss\>"           contained
syn   match    apdlFunction   display   "ssbt\>"           contained
syn   match    apdlFunction   display   "ssln\>"           contained
syn   match    apdlFunction   display   "ssmt\>"           contained
syn   match    apdlFunction   display   "sspa\>"           contained
syn   match    apdlFunction   display   "sspb\>"           contained
syn   match    apdlFunction   display   "sspd\>"           contained
syn   match    apdlFunction   display   "sspe\>"           contained
syn   match    apdlFunction   display   "sspm\>"           contained
syn   match    apdlFunction   display   "ssum\>"           contained
syn   match    apdlFunction   display   "stabilize\>"      contained
syn   match    apdlFunction   display   "staopt\>"         contained
syn   match    apdlFunction   display   "stat\>"           contained
syn   match    apdlFunction   display   "stef\>"           contained
syn   match    apdlFunction   display   "store\>"          contained
syn   match    apdlFunction   display   "subopt\>"         contained
syn   match    apdlFunction   display   "subset\>"         contained
syn   match    apdlFunction   display   "sucalc\>"         contained
syn   match    apdlFunction   display   "sucr\>"           contained
syn   match    apdlFunction   display   "sudel\>"          contained
syn   match    apdlFunction   display   "sueval\>"         contained
syn   match    apdlFunction   display   "suget\>"          contained
syn   match    apdlFunction   display   "sumap\>"          contained
syn   match    apdlFunction   display   "sumtype\>"        contained
syn   match    apdlFunction   display   "supl\>"           contained
syn   match    apdlFunction   display   "supr\>"           contained
syn   match    apdlFunction   display   "suresu\>"         contained
syn   match    apdlFunction   display   "susave\>"         contained
syn   match    apdlFunction   display   "susel\>"          contained
syn   match    apdlFunction   display   "suvect\>"         contained
syn   match    apdlFunction   display   "sv\>"             contained
syn   match    apdlFunction   display   "svplot\>"         contained
syn   match    apdlFunction   display   "svtyp\>"          contained
syn   match    apdlFunction   display   "swadd\>"          contained
syn   match    apdlFunction   display   "swdel\>"          contained
syn   match    apdlFunction   display   "swgen\>"          contained
syn   match    apdlFunction   display   "swlist\>"         contained
syn   match    apdlFunction   display   "synchro\>"        contained
syn   match    apdlFunction   display   "tallow\>"         contained
syn   match    apdlFunction   display   "target\>"         contained
syn   match    apdlFunction   display   "tb\>"             contained
syn   match    apdlFunction   display   "tbcopy\>"         contained
syn   match    apdlFunction   display   "tbdata\>"         contained
syn   match    apdlFunction   display   "tbdele\>"         contained
syn   match    apdlFunction   display   "tbeo\>"           contained
syn   match    apdlFunction   display   "tbfield\>"        contained
syn   match    apdlFunction   display   "tbft\>"           contained
syn   match    apdlFunction   display   "tbin\>"           contained
syn   match    apdlFunction   display   "tble\>"           contained
syn   match    apdlFunction   display   "tblist\>"         contained
syn   match    apdlFunction   display   "tbmodif\>"        contained
syn   match    apdlFunction   display   "tbplot\>"         contained
syn   match    apdlFunction   display   "tbpt\>"           contained
syn   match    apdlFunction   display   "tbtemp\>"         contained
syn   match    apdlFunction   display   "tchg\>"           contained
syn   match    apdlFunction   display   "term\>"           contained
syn   match    apdlFunction   display   "thexpand\>"       contained
syn   match    apdlFunction   display   "thopt\>"          contained
syn   match    apdlFunction   display   "time\>"           contained
syn   match    apdlFunction   display   "timerange\>"      contained
syn   match    apdlFunction   display   "timint\>"         contained
syn   match    apdlFunction   display   "timp\>"           contained
syn   match    apdlFunction   display   "tintp\>"          contained
syn   match    apdlFunction   display   "toffst\>"         contained
syn   match    apdlFunction   display   "torq2d\>"         contained
syn   match    apdlFunction   display   "torqc2d\>"        contained
syn   match    apdlFunction   display   "torqsum\>"        contained
syn   match    apdlFunction   display   "torus\>"          contained
syn   match    apdlFunction   display   "trans\>"          contained
syn   match    apdlFunction   display   "transfer\>"       contained
syn   match    apdlFunction   display   "tref\>"           contained
syn   match    apdlFunction   display   "trnopt\>"         contained
syn   match    apdlFunction   display   "trpdel\>"         contained
syn   match    apdlFunction   display   "trplis\>"         contained
syn   match    apdlFunction   display   "trpoin\>"         contained
syn   match    apdlFunction   display   "trtime\>"         contained
syn   match    apdlFunction   display   "tshap\>"          contained
syn   match    apdlFunction   display   "tsres\>"          contained
syn   match    apdlFunction   display   "tunif\>"          contained
syn   match    apdlFunction   display   "tvar\>"           contained
syn   match    apdlFunction   display   "type\>"           contained
syn   match    apdlFunction   display   "uimp\>"           contained
syn   match    apdlFunction   display   "undelete\>"       contained
syn   match    apdlFunction   display   "undo\>"           contained
syn   match    apdlFunction   display   "unpause\>"        contained
syn   match    apdlFunction   display   "upcoord\>"        contained
syn   match    apdlFunction   display   "upgeom\>"         contained
syn   match    apdlFunction   display   "usrcal\>"         contained
syn   match    apdlFunction   display   "usrdof\>"         contained
syn   match    apdlFunction   display   "usrelem\>"        contained
syn   match    apdlFunction   display   "v2dopt\>"         contained
syn   match    apdlFunction   display   "v\>"              contained
syn   match    apdlFunction   display   "va\>"             contained
syn   match    apdlFunction   display   "vadd\>"           contained
syn   match    apdlFunction   display   "vardel\>"         contained
syn   match    apdlFunction   display   "varnam\>"         contained
syn   match    apdlFunction   display   "vatt\>"           contained
syn   match    apdlFunction   display   "vclear\>"         contained
syn   match    apdlFunction   display   "vcross\>"         contained
syn   match    apdlFunction   display   "vddam\>"          contained
syn   match    apdlFunction   display   "vdele\>"          contained
syn   match    apdlFunction   display   "vdgl\>"           contained
syn   match    apdlFunction   display   "vdot\>"           contained
syn   match    apdlFunction   display   "vdrag\>"          contained
syn   match    apdlFunction   display   "veorient\>"       contained
syn   match    apdlFunction   display   "vext\>"           contained
syn   match    apdlFunction   display   "vfopt\>"          contained
syn   match    apdlFunction   display   "vfquery\>"        contained
syn   match    apdlFunction   display   "vfsm\>"           contained
syn   match    apdlFunction   display   "vgen\>"           contained
syn   match    apdlFunction   display   "vget\>"           contained
syn   match    apdlFunction   display   "vglue\>"          contained
syn   match    apdlFunction   display   "vimp\>"           contained
syn   match    apdlFunction   display   "vinp\>"           contained
syn   match    apdlFunction   display   "vinv\>"           contained
syn   match    apdlFunction   display   "vlist\>"          contained
syn   match    apdlFunction   display   "vlscale\>"        contained
syn   match    apdlFunction   display   "vmesh\>"          contained
syn   match    apdlFunction   display   "voffst\>"         contained
syn   match    apdlFunction   display   "volumes\>"        contained
syn   match    apdlFunction   display   "vovlap\>"         contained
syn   match    apdlFunction   display   "vplot\>"          contained
syn   match    apdlFunction   display   "vptn\>"           contained
syn   match    apdlFunction   display   "vput\>"           contained
syn   match    apdlFunction   display   "vrotat\>"         contained
syn   match    apdlFunction   display   "vsba\>"           contained
syn   match    apdlFunction   display   "vsbv\>"           contained
syn   match    apdlFunction   display   "vsbw\>"           contained
syn   match    apdlFunction   display   "vsum\>"           contained
syn   match    apdlFunction   display   "vsweep\>"         contained
syn   match    apdlFunction   display   "vsymm\>"          contained
syn   match    apdlFunction   display   "vtran\>"          contained
syn   match    apdlFunction   display   "vtype\>"          contained
syn   match    apdlFunction   display   "waves\>"          contained
syn   match    apdlFunction   display   "werase\>"         contained
syn   match    apdlFunction   display   "wfront\>"         contained
syn   match    apdlFunction   display   "wmid\>"           contained
syn   match    apdlFunction   display   "wmore\>"          contained
syn   match    apdlFunction   display   "wpave\>"          contained
syn   match    apdlFunction   display   "wpcsys\>"         contained
syn   match    apdlFunction   display   "wplane\>"         contained
syn   match    apdlFunction   display   "wpoffs\>"         contained
syn   match    apdlFunction   display   "wprota\>"         contained
syn   match    apdlFunction   display   "wpstyl\>"         contained
syn   match    apdlFunction   display   "wrfull\>"         contained
syn   match    apdlFunction   display   "write\>"          contained
syn   match    apdlFunction   display   "writemap\>"       contained
syn   match    apdlFunction   display   "wsort\>"          contained
syn   match    apdlFunction   display   "wsprings\>"       contained
syn   match    apdlFunction   display   "wstart\>"         contained
syn   match    apdlFunction   display   "wtbcreate\>"      contained
syn   match    apdlFunction   display   "xvar\>"           contained

" apdl selection commands
syn   match   apdlSelection   display   "allsel\>"   contained
syn   match   apdlSelection   display   "seltol\>"   contained
syn   match   apdlSelection   display   "ksel\>"     contained
syn   match   apdlSelection   display   "lsel\>"     contained
syn   match   apdlSelection   display   "asel\>"     contained
syn   match   apdlSelection   display   "vsel\>"     contained
syn   match   apdlSelection   display   "nsel\>"     contained
syn   match   apdlSelection   display   "esel\>"     contained

syn   match   apdlSelection   display   "asll\>"      contained
syn   match   apdlSelection   display   "aslv\>"      contained
syn   match   apdlSelection   display   "esla\>"      contained
syn   match   apdlSelection   display   "esll\>"      contained
syn   match   apdlSelection   display   "esln\>"      contained
syn   match   apdlSelection   display   "eslv\>"      contained
syn   match   apdlSelection   display   "ksll\>"      contained
syn   match   apdlSelection   display   "ksln\>"      contained
syn   match   apdlSelection   display   "lsla\>"      contained
syn   match   apdlSelection   display   "lslk\>"      contained
syn   match   apdlSelection   display   "nsla\>"      contained
syn   match   apdlSelection   display   "nsle\>"      contained
syn   match   apdlSelection   display   "nslk\>"      contained
syn   match   apdlSelection   display   "nsll\>"      contained
syn   match   apdlSelection   display   "nslv\>"      contained
syn   match   apdlSelection   display   "vsla\>"      contained
syn   match   apdlSelection   display   "partsel\>"   contained
syn   match   apdlSelection   display   "dofsel\>"    contained

syn   match   apdlSelection   display   "cm\>"        contained
syn   match   apdlSelection   display   "cmdele\>"    contained
syn   match   apdlSelection   display   "cmedit\>"    contained
syn   match   apdlSelection   display   "cmgrp\>"     contained
syn   match   apdlSelection   display   "cmlist\>"    contained
syn   match   apdlSelection   display   "cmmod\>"     contained
syn   match   apdlSelection   display   "cmplot\>"    contained
syn   match   apdlSelection   display   "cmsel\>"     contained
syn   match   apdlSelection   display   "cmwrite\>"   contained

" apdl display commands
syn   match 	 apdlDisplay 	 display   "/show\>"         contained
syn   match    apdlDisplay    display   "/an3d\>"        contained
syn   match    apdlDisplay    display   "/angle\>"       contained
syn   match    apdlDisplay    display   "/annot\>"       contained
syn   match    apdlDisplay    display   "/anum\>"        contained
syn   match    apdlDisplay    display   "/auto\>"        contained
syn   match    apdlDisplay    display   "/axlab\>"       contained
syn   match    apdlDisplay    display   "/cformat\>"     contained
syn   match    apdlDisplay    display   "/clabel\>"      contained
syn   match    apdlDisplay    display   "/cmap\>"        contained
syn   match    apdlDisplay    display   "/color\>"       contained
syn   match    apdlDisplay    display   "/contour\>"     contained
syn   match    apdlDisplay    display   "/cplane\>"      contained
syn   match    apdlDisplay    display   "/ctype\>"       contained
syn   match    apdlDisplay    display   "/cval\>"        contained
syn   match    apdlDisplay    display   "/cycexpand\>"   contained
syn   match    apdlDisplay    display   "/devdisp\>"     contained
syn   match    apdlDisplay    display   "/device\>"      contained
syn   match    apdlDisplay    display   "/dist\>"        contained
syn   match    apdlDisplay    display   "/dscale\>"      contained
syn   match    apdlDisplay    display   "/dv3d\>"        contained
syn   match    apdlDisplay    display   "/edge\>"        contained
syn   match    apdlDisplay    display   "/efacet\>"      contained
syn   match    apdlDisplay    display   "/erase\>"       contained
syn   match    apdlDisplay    display   "/eshape\>"      contained
syn   match    apdlDisplay    display   "/expand\>"      contained
syn   match    apdlDisplay    display   "/facet\>"       contained
syn   match    apdlDisplay    display   "/focus\>"       contained
syn   match    apdlDisplay    display   "/gcmd\>"        contained
syn   match    apdlDisplay    display   "/gcolumn\>"     contained
syn   match    apdlDisplay    display   "/gfile\>"       contained
syn   match    apdlDisplay    display   "/gformat\>"     contained
syn   match    apdlDisplay    display   "/gline\>"       contained
syn   match    apdlDisplay    display   "/gmarker\>"     contained
syn   match    apdlDisplay    display   "/graphics\>"    contained
syn   match    apdlDisplay    display   "/gresume\>"     contained
syn   match    apdlDisplay    display   "/grid\>"        contained
syn   match    apdlDisplay    display   "/gropt\>"       contained
syn   match    apdlDisplay    display   "/grtyp\>"       contained
syn   match    apdlDisplay    display   "/gsave\>"       contained
syn   match    apdlDisplay    display   "/gthk\>"        contained
syn   match    apdlDisplay    display   "/gtype\>"       contained
syn   match    apdlDisplay    display   "/hbc\>"         contained
syn   match    apdlDisplay    display   "/iclwid\>"      contained
syn   match    apdlDisplay    display   "/image\>"       contained
syn   match    apdlDisplay    display   "/larc\>"        contained
syn   match    apdlDisplay    display   "/light\>"       contained
syn   match    apdlDisplay    display   "/line\>"        contained
syn   match    apdlDisplay    display   "/lspec\>"       contained
syn   match    apdlDisplay    display   "/lsymbol\>"     contained
syn   match    apdlDisplay    display   "/mrep\>"        contained
syn   match    apdlDisplay    display   "/noerase\>"     contained
syn   match    apdlDisplay    display   "/normal\>"      contained
syn   match    apdlDisplay    display   "/number\>"      contained
syn   match    apdlDisplay    display   "/pbc\>"         contained
syn   match    apdlDisplay    display   "/pbf\>"         contained
syn   match    apdlDisplay    display   "/pcircle\>"     contained
syn   match    apdlDisplay    display   "/pcopy\>"       contained
syn   match    apdlDisplay    display   "/pice\>"        contained
syn   match    apdlDisplay    display   "/plopts\>"      contained
syn   match    apdlDisplay    display   "/pmore\>"       contained
syn   match    apdlDisplay    display   "/pnum\>"        contained
syn   match    apdlDisplay    display   "/polygon\>"     contained
syn   match    apdlDisplay    display   "/psf\>"         contained
syn   match    apdlDisplay    display   "/pspec\>"       contained
syn   match    apdlDisplay    display   "/pstatus\>"     contained
syn   match    apdlDisplay    display   "/psymb\>"       contained
syn   match    apdlDisplay    display   "/pwedge\>"      contained
syn   match    apdlDisplay    display   "/ratio\>"       contained
syn   match    apdlDisplay    display   "/replot\>"      contained
syn   match    apdlDisplay    display   "/reset\>"       contained
syn   match    apdlDisplay    display   "/rgb\>"         contained
syn   match    apdlDisplay    display   "/seg\>"         contained
syn   match    apdlDisplay    display   "/shade\>"       contained
syn   match    apdlDisplay    display   "/showdisp\>"    contained
syn   match    apdlDisplay    display   "/shrink\>"      contained
syn   match    apdlDisplay    display   "/smbc\>"        contained
syn   match    apdlDisplay    display   "/sscale\>"      contained
syn   match    apdlDisplay    display   "/tlabel\>"      contained
syn   match    apdlDisplay    display   "/triad\>"       contained
syn   match    apdlDisplay    display   "/trlcy\>"       contained
syn   match    apdlDisplay    display   "/tspec\>"       contained
syn   match    apdlDisplay    display   "/txtre\>"       contained
syn   match    apdlDisplay    display   "/type\>"        contained
syn   match    apdlDisplay    display   "/udoc\>"        contained
syn   match    apdlDisplay    display   "/user\>"        contained
syn   match    apdlDisplay    display   "/vcone\>"       contained
syn   match    apdlDisplay    display   "/view\>"        contained
syn   match    apdlDisplay    display   "/vscale\>"      contained
syn   match    apdlDisplay    display   "/vup\>"         contained
syn   match    apdlDisplay    display   "/window\>"      contained
syn   match    apdlDisplay    display   "/xfrm\>"        contained
syn   match    apdlDisplay    display   "/xrange\>"      contained
syn   match    apdlDisplay    display   "/yrange\>"      contained
syn   match    apdlDisplay    display   "/zoom\>"        contained
syn   match    apdlDisplay    display   "erase\>"        contained
syn   match    apdlDisplay    display   "gmface\>"       contained
syn   match    apdlDisplay    display   "immed\>"        contained
syn   match    apdlDisplay    display   "jpeg\>"         contained
syn   match    apdlDisplay    display   "pgsele\>"       contained
syn   match    apdlDisplay    display   "pngr\>"         contained
syn   match    apdlDisplay    display   "pscr\>"         contained
syn   match    apdlDisplay    display   "tiff\>"         contained

" ansys processor entry
syn   match 	 apdlProcessor 	 display   "/aux2\>"     contained
syn   match    apdlProcessor    display   "/aux3\>"    contained
syn   match 	 apdlProcessor 	 display   "/aux12\>"    contained
syn   match 	 apdlProcessor 	 display   "/aux15\>"    contained
syn   match 	 apdlProcessor 	 display   "/post1\>"    contained
syn   match 	 apdlProcessor 	 display   "/post26\>"   contained
syn   match 	 apdlProcessor 	 display   "/prep7\>"    contained
syn   match 	 apdlProcessor 	 display   "/quit\>"     contained
syn   match 	 apdlProcessor 	 display   "/solu\>"     contained
syn   match 	 apdlProcessor 	 display   "finish\>"    contained

"
" End of autoextracted part.
"
" apdl argument separator
syn match apdlComma display "\v,"
"
" apdl parameter substitution
syn match apdlParameterSubstitution display "\v\%[ _a-zA-Z0-9]*\%"
"
" apdl local parameters (arg1-arg9 ar10-ar99)
syn match apdlArgParameters display "\v(arg[1-9]|ar[1-9][0-9])"
"
" apdl custom macros
syn   match   apdlMacro   display   "aabove\>"               contained
syn   match   apdlMacro   display   "abackup\>"              contained
syn   match   apdlMacro   display   "acen\>"                 contained
syn   match   apdlMacro   display   "actvpath\>"             contained
syn   match   apdlMacro   display   "addforx\>"              contained
syn   match   apdlMacro   display   "addfory\>"              contained
syn   match   apdlMacro   display   "addforz\>"              contained
syn   match   apdlMacro   display   "afunbackup\>"           contained
syn   match   apdlMacro   display   "afunrestore\>"          contained
syn   match   apdlMacro   display   "ahelix\>"               contained
syn   match   apdlMacro   display   "anno\>"                 contained
syn   match   apdlMacro   display   "annogrid\>"             contained
syn   match   apdlMacro   display   "annotable\>"            contained
syn   match   apdlMacro   display   "annotxtarray\>"         contained
syn   match   apdlMacro   display   "anrm\>"                 contained
syn   match   apdlMacro   display   "appnd\>"                contained
syn   match   apdlMacro   display   "apportionedstats\>"     contained
syn   match   apdlMacro   display   "aradslice\>"            contained
syn   match   apdlMacro   display   "arestore\>"             contained
syn   match   apdlMacro   display   "argdefault\>"           contained
syn   match   apdlMacro   display   "arr2pth\>"              contained
syn   match   apdlMacro   display   "arr2strarr\>"           contained
syn   match   apdlMacro   display   "arrput\>"               contained
syn   match   apdlMacro   display   "arrcdr\>"               contained
syn   match   apdlMacro   display   "arrdel\>"               contained
syn   match   apdlMacro   display   "arrinit\>"              contained
syn   match   apdlMacro   display   "arrjoin\>"              contained
syn   match   apdlMacro   display   "arrlims\>"              contained
syn   match   apdlMacro   display   "arrreverse\>"           contained
syn   match   apdlMacro   display   "arruniq\>"              contained
syn   match   apdlMacro   display   "arxori\>"               contained
syn   match   apdlMacro   display   "aryori\>"               contained
syn   match   apdlMacro   display   "arzori\>"               contained
syn   match   apdlMacro   display   "avgshlet\>"             contained
syn   match   apdlMacro   display   "axanno\>"               contained
syn   match   apdlMacro   display   "batch_slicexy\>"        contained
syn   match   apdlMacro   display   "batch_slicexz\>"        contained
syn   match   apdlMacro   display   "batch_sliceyz\>"        contained
syn   match   apdlMacro   display   "beam_mt\>"              contained
syn   match   apdlMacro   display   "beam_my\>"              contained
syn   match   apdlMacro   display   "beam_mz\>"              contained
syn   match   apdlMacro   display   "beam_n\>"               contained
syn   match   apdlMacro   display   "beam_qy\>"              contained
syn   match   apdlMacro   display   "beam_qz\>"              contained
syn   match   apdlMacro   display   "beam_rotx\>"            contained
syn   match   apdlMacro   display   "beam_roty\>"            contained
syn   match   apdlMacro   display   "beam_rotz\>"            contained
syn   match   apdlMacro   display   "beam_ux\>"              contained
syn   match   apdlMacro   display   "beam_uy\>"              contained
syn   match   apdlMacro   display   "beam_uz\>"              contained
syn   match   apdlMacro   display   "beamcopy\>"             contained
syn   match   apdlMacro   display   "beamenvpeak\>"          contained
syn   match   apdlMacro   display   "bhelix\>"               contained
syn   match   apdlMacro   display   "bitwise\>"              contained
syn   match   apdlMacro   display   "boldfont\>"             contained
syn   match   apdlMacro   display   "boussinesq\>"           contained
syn   match   apdlMacro   display   "canim\>"                contained
syn   match   apdlMacro   display   "cdate\>"                contained
syn   match   apdlMacro   display   "cedisach\>"             contained
syn   match   apdlMacro   display   "cedisacs\>"             contained
syn   match   apdlMacro   display   "cedisacvs\>"            contained
syn   match   apdlMacro   display   "cedisal\>"              contained
syn   match   apdlMacro   display   "cedisat\>"              contained
syn   match   apdlMacro   display   "cedisatq\>"             contained
syn   match   apdlMacro   display   "cedisatr\>"             contained
syn   match   apdlMacro   display   "cedisau\>"              contained
syn   match   apdlMacro   display   "cedisaude\>"            contained
syn   match   apdlMacro   display   "cedisauds\>"            contained
syn   match   apdlMacro   display   "cedisavs\>"             contained
syn   match   apdlMacro   display   "cleanplot\>"            contained
syn   match   apdlMacro   display   "clims\>"                contained
syn   match   apdlMacro   display   "cmbbox\>"               contained
syn   match   apdlMacro   display   "cmpadd\>"               contained
syn   match   apdlMacro   display   "cmpatoe\>"              contained
syn   match   apdlMacro   display   "cmpslice\>"             contained
syn   match   apdlMacro   display   "cmwslice\>"             contained
syn   match   apdlMacro   display   "cncthsx\>"              contained
syn   match   apdlMacro   display   "cnt\>"                  contained
syn   match   apdlMacro   display   "cntbnd\>"               contained
syn   match   apdlMacro   display   "cntdef\>"               contained
syn   match   apdlMacro   display   "cntrlims\>"             contained
syn   match   apdlMacro   display   "combcp\>"               contained
syn   match   apdlMacro   display   "concrete\>"             contained
syn   match   apdlMacro   display   "concrlaw\>"             contained
syn   match   apdlMacro   display   "conicalar\>"            contained
syn   match   apdlMacro   display   "cons\>"                 contained
syn   match   apdlMacro   display   "copyar\>"               contained
syn   match   apdlMacro   display   "corbelfcn\>"            contained
syn   match   apdlMacro   display   "cpath\>"                contained
syn   match   apdlMacro   display   "csbackup\>"             contained
syn   match   apdlMacro   display   "csby2p\>"               contained
syn   match   apdlMacro   display   "cshell_mx\>"            contained
syn   match   apdlMacro   display   "cshell_my\>"            contained
syn   match   apdlMacro   display   "cshell_nx\>"            contained
syn   match   apdlMacro   display   "cshell_ny\>"            contained
syn   match   apdlMacro   display   "cshell_qx\>"            contained
syn   match   apdlMacro   display   "cshell_qy\>"            contained
syn   match   apdlMacro   display   "csnext\>"               contained
syn   match   apdlMacro   display   "csrestore\>"            contained
syn   match   apdlMacro   display   "csslicexy\>"            contained
syn   match   apdlMacro   display   "csslicexz\>"            contained
syn   match   apdlMacro   display   "cssliceyz\>"            contained
syn   match   apdlMacro   display   "ctime\>"                contained
syn   match   apdlMacro   display   "ctmanim\>"              contained
syn   match   apdlMacro   display   "danim\>"                contained
syn   match   apdlMacro   display   "dcpsort\>"              contained
syn   match   apdlMacro   display   "def_etabs\>"            contained
syn   match   apdlMacro   display   "defetabs\>"             contained
syn   match   apdlMacro   display   "deflect\>"              contained
syn   match   apdlMacro   display   "defpost\>"              contained
syn   match   apdlMacro   display   "defthist\>"             contained
syn   match   apdlMacro   display   "designld\>"             contained
syn   match   apdlMacro   display   "dfcy188\>"              contained
syn   match   apdlMacro   display   "dfcz188\>"              contained
syn   match   apdlMacro   display   "dflz188\>"              contained
syn   match   apdlMacro   display   "dfn188\>"               contained
syn   match   apdlMacro   display   "disptoolbar\>"          contained
syn   match   apdlMacro   display   "distpres\>"             contained
syn   match   apdlMacro   display   "dmfy188\>"              contained
syn   match   apdlMacro   display   "dmfz188\>"              contained
syn   match   apdlMacro   display   "dmt188\>"               contained
syn   match   apdlMacro   display   "dmx181\>"               contained
syn   match   apdlMacro   display   "dmxy181\>"              contained
syn   match   apdlMacro   display   "dmy181\>"               contained
syn   match   apdlMacro   display   "dnx181\>"               contained
syn   match   apdlMacro   display   "dnxy181\>"              contained
syn   match   apdlMacro   display   "dny181\>"               contained
syn   match   apdlMacro   display   "dqx181\>"               contained
syn   match   apdlMacro   display   "dqy181\>"               contained
syn   match   apdlMacro   display   "draw_ibeam\>"           contained
syn   match   apdlMacro   display   "drawcone\>"             contained
syn   match   apdlMacro   display   "drawpipe\>"             contained
syn   match   apdlMacro   display   "dscalefct\>"            contained
syn   match   apdlMacro   display   "dspndist\>"             contained
syn   match   apdlMacro   display   "eanim\>"                contained
syn   match   apdlMacro   display   "ebackup\>"              contained
syn   match   apdlMacro   display   "edgerelease\>"          contained
syn   match   apdlMacro   display   "edpsoil\>"              contained
syn   match   apdlMacro   display   "elasticbase\>"          contained
syn   match   apdlMacro   display   "elasticinterface\>"     contained
syn   match   apdlMacro   display   "elrestore\>"            contained
syn   match   apdlMacro   display   "endpng\>"               contained
syn   match   apdlMacro   display   "enrm\>"                 contained
syn   match   apdlMacro   display   "etbplneg\>"             contained
syn   match   apdlMacro   display   "etbplpos\>"             contained
syn   match   apdlMacro   display   "etbsqsum\>"             contained
syn   match   apdlMacro   display   "etbtrim\>"              contained
syn   match   apdlMacro   display   "etenv\>"                contained
syn   match   apdlMacro   display   "etindex\>"              contained
syn   match   apdlMacro   display   "expfcnz\>"              contained
syn   match   apdlMacro   display   "fbt\>"                  contained
syn   match   apdlMacro   display   "fbtsig\>"               contained
syn   match   apdlMacro   display   "fhour\>"                contained
syn   match   apdlMacro   display   "fitarr\>"               contained
syn   match   apdlMacro   display   "flnodes\>"              contained
syn   match   apdlMacro   display   "fontstyle\>"            contained
syn   match   apdlMacro   display   "g_annobold\>"           contained
syn   match   apdlMacro   display   "g_annocharwidth\>"      contained
syn   match   apdlMacro   display   "g_picres\>"             contained
syn   match   apdlMacro   display   "genstress\>"            contained
syn   match   apdlMacro   display   "gerdau2l\>"             contained
syn   match   apdlMacro   display   "gerdaub\>"              contained
syn   match   apdlMacro   display   "gerdauch\>"             contained
syn   match   apdlMacro   display   "gerdauh\>"              contained
syn   match   apdlMacro   display   "gerdaui\>"              contained
syn   match   apdlMacro   display   "gerdaul\>"              contained
syn   match   apdlMacro   display   "gerdauq\>"              contained
syn   match   apdlMacro   display   "gerdaut\>"              contained
syn   match   apdlMacro   display   "gerdauu\>"              contained
syn   match   apdlMacro   display   "gerdauude\>"            contained
syn   match   apdlMacro   display   "gerdauuds\>"            contained
syn   match   apdlMacro   display   "getafun\>"              contained
syn   match   apdlMacro   display   "getjname\>"             contained
syn   match   apdlMacro   display   "getldattr\>"            contained
syn   match   apdlMacro   display   "getndpos\>"             contained
syn   match   apdlMacro   display   "getnpres\>"             contained
syn   match   apdlMacro   display   "go2png\>"               contained
syn   match   apdlMacro   display   "granim\>"               contained
syn   match   apdlMacro   display   "graphanim\>"            contained
syn   match   apdlMacro   display   "grseq\>"                contained
syn   match   apdlMacro   display   "gscontours\>"           contained
syn   match   apdlMacro   display   "helix\>"                contained
syn   match   apdlMacro   display   "hlxori\>"               contained
syn   match   apdlMacro   display   "ibeam\>"                contained
syn   match   apdlMacro   display   "ibeamms\>"              contained
syn   match   apdlMacro   display   "ibeamstf\>"             contained
syn   match   apdlMacro   display   "init\>"                 contained
syn   match   apdlMacro   display   "intsksel\>"             contained
syn   match   apdlMacro   display   "iso834\>"               contained
syn   match   apdlMacro   display   "kbackup\>"              contained
syn   match   apdlMacro   display   "kmaxx\>"                contained
syn   match   apdlMacro   display   "kmaxy\>"                contained
syn   match   apdlMacro   display   "kmaxz\>"                contained
syn   match   apdlMacro   display   "kminx\>"                contained
syn   match   apdlMacro   display   "kminy\>"                contained
syn   match   apdlMacro   display   "kminz\>"                contained
syn   match   apdlMacro   display   "korient\>"              contained
syn   match   apdlMacro   display   "krestore\>"             contained
syn   match   apdlMacro   display   "ksort\>"                contained
syn   match   apdlMacro   display   "larrowyz\>"             contained
syn   match   apdlMacro   display   "lasttime\>"             contained
syn   match   apdlMacro   display   "lbackup\>"              contained
syn   match   apdlMacro   display   "lcinit\>"               contained
syn   match   apdlMacro   display   "lcross\>"               contained
syn   match   apdlMacro   display   "ldcomb\>"               contained
syn   match   apdlMacro   display   "ldeflect\>"             contained
syn   match   apdlMacro   display   "letabval\>"             contained
syn   match   apdlMacro   display   "lf_fourier\>"           contained
syn   match   apdlMacro   display   "lf_harmonic\>"          contained
syn   match   apdlMacro   display   "lf_impulse\>"           contained
syn   match   apdlMacro   display   "lf_linear\>"            contained
syn   match   apdlMacro   display   "lhelix\>"               contained
syn   match   apdlMacro   display   "lib_base\>"             contained
syn   match   apdlMacro   display   "linfcny\>"              contained
syn   match   apdlMacro   display   "linfcnz\>"              contained
syn   match   apdlMacro   display   "lnxori\>"               contained
syn   match   apdlMacro   display   "lnyori\>"               contained
syn   match   apdlMacro   display   "lnzori\>"               contained
syn   match   apdlMacro   display   "loadtrain\>"            contained
syn   match   apdlMacro   display   "loc2glo\>"              contained
syn   match   apdlMacro   display   "locsort\>"              contained
syn   match   apdlMacro   display   "lrestore\>"             contained
syn   match   apdlMacro   display   "lsoilspring\>"          contained
syn   match   apdlMacro   display   "lwpsliceyz\>"           contained
syn   match   apdlMacro   display   "maindir\>"              contained
syn   match   apdlMacro   display   "mcsoil\>"               contained
syn   match   apdlMacro   display   "mkdirs\>"               contained
syn   match   apdlMacro   display   "mpathplot\>"            contained
syn   match   apdlMacro   display   "mpopbackup\>"           contained
syn   match   apdlMacro   display   "mpoprestore\>"          contained
syn   match   apdlMacro   display   "mxlambda\>"             contained
syn   match   apdlMacro   display   "mxnres\>"               contained
syn   match   apdlMacro   display   "nbackup\>"              contained
syn   match   apdlMacro   display   "ndbbox\>"               contained
syn   match   apdlMacro   display   "ndeflect\>"             contained
syn   match   apdlMacro   display   "ndlfun\>"               contained
syn   match   apdlMacro   display   "ndsort\>"               contained
syn   match   apdlMacro   display   "ndstr\>"                contained
syn   match   apdlMacro   display   "ndstr2\>"               contained
syn   match   apdlMacro   display   "nextkp\>"               contained
syn   match   apdlMacro   display   "nextnd\>"               contained
syn   match   apdlMacro   display   "nextreal\>"             contained
syn   match   apdlMacro   display   "nmaxx\>"                contained
syn   match   apdlMacro   display   "nmaxy\>"                contained
syn   match   apdlMacro   display   "nmaxz\>"                contained
syn   match   apdlMacro   display   "nminx\>"                contained
syn   match   apdlMacro   display   "nminy\>"                contained
syn   match   apdlMacro   display   "nminz\>"                contained
syn   match   apdlMacro   display   "nrestore\>"             contained
syn   match   apdlMacro   display   "nslcomp\>"              contained
syn   match   apdlMacro   display   "num2str\>"              contained
syn   match   apdlMacro   display   "obackup\>"              contained
syn   match   apdlMacro   display   "oplot\>"                contained
syn   match   apdlMacro   display   "orestore\>"             contained
syn   match   apdlMacro   display   "orient\>"               contained
syn   match   apdlMacro   display   "p4gon\>"                contained
syn   match   apdlMacro   display   "parcoef\>"              contained
syn   match   apdlMacro   display   "pardefault\>"           contained
syn   match   apdlMacro   display   "parfcnz\>"              contained
syn   match   apdlMacro   display   "parverify\>"            contained
syn   match   apdlMacro   display   "pcbackup\>"             contained
syn   match   apdlMacro   display   "pcrestore\>"            contained
syn   match   apdlMacro   display   "plpthenv\>"             contained
syn   match   apdlMacro   display   "posang\>"               contained
syn   match   apdlMacro   display   "posttoolbar\>"          contained
syn   match   apdlMacro   display   "prfsum\>"               contained
syn   match   apdlMacro   display   "propdmp\>"              contained
syn   match   apdlMacro   display   "protend\>"              contained
syn   match   apdlMacro   display   "pst26\>"                contained
syn   match   apdlMacro   display   "pstack\>"               contained
syn   match   apdlMacro   display   "pth2arr\>"              contained
syn   match   apdlMacro   display   "pth2beam\>"             contained
syn   match   apdlMacro   display   "pth2dfl\>"              contained
syn   match   apdlMacro   display   "pthanim\>"              contained
syn   match   apdlMacro   display   "pthbycs\>"              contained
syn   match   apdlMacro   display   "pthdflct\>"             contained
syn   match   apdlMacro   display   "pthenv\>"               contained
syn   match   apdlMacro   display   "pthfreeidx\>"           contained
syn   match   apdlMacro   display   "pthlabelidx\>"          contained
syn   match   apdlMacro   display   "pthlims\>"              contained
syn   match   apdlMacro   display   "pthnlist\>"             contained
syn   match   apdlMacro   display   "pthrebase\>"            contained
syn   match   apdlMacro   display   "pths2mn\>"              contained
syn   match   apdlMacro   display   "pths2v\>"               contained
syn   match   apdlMacro   display   "radslice\>"             contained
syn   match   apdlMacro   display   "range\>"                contained
syn   match   apdlMacro   display   "rctube\>"               contained
syn   match   apdlMacro   display   "rebarmesh\>"            contained
syn   match   apdlMacro   display   "rebartruss\>"           contained
syn   match   apdlMacro   display   "recasll\>"              contained
syn   match   apdlMacro   display   "reclslk\>"              contained
syn   match   apdlMacro   display   "rectube\>"              contained
syn   match   apdlMacro   display   "redsects2pth\>"         contained
syn   match   apdlMacro   display   "release\>"              contained
syn   match   apdlMacro   display   "rndpoly\>"              contained
syn   match   apdlMacro   display   "rot188\>"               contained
syn   match   apdlMacro   display   "rot2point\>"            contained
syn   match   apdlMacro   display   "rsum\>"                 contained
syn   match   apdlMacro   display   "safe_cmsel\>"           contained
syn   match   apdlMacro   display   "safe_cp\>"              contained
syn   match   apdlMacro   display   "scanpath\>"             contained
syn   match   apdlMacro   display   "scansurf\>"             contained
syn   match   apdlMacro   display   "sec_2l\>"               contained
syn   match   apdlMacro   display   "sec_2lt\>"              contained
syn   match   apdlMacro   display   "sec_2lu\>"              contained
syn   match   apdlMacro   display   "sec_2rail\>"            contained
syn   match   apdlMacro   display   "sec_ccirc\>"            contained
syn   match   apdlMacro   display   "sec_finish\>"           contained
syn   match   apdlMacro   display   "sec_ftube\>"            contained
syn   match   apdlMacro   display   "sec_girder\>"           contained
syn   match   apdlMacro   display   "sec_hat\>"              contained
syn   match   apdlMacro   display   "sec_icomp\>"            contained
syn   match   apdlMacro   display   "sec_icomp2\>"           contained
syn   match   apdlMacro   display   "sec_icompinv\>"         contained
syn   match   apdlMacro   display   "sec_init\>"             contained
syn   match   apdlMacro   display   "sec_rail\>"             contained
syn   match   apdlMacro   display   "sec_ue\>"               contained
syn   match   apdlMacro   display   "selevolu\>"             contained
syn   match   apdlMacro   display   "senvpeak\>"             contained
syn   match   apdlMacro   display   "setanim\>"              contained
syn   match   apdlMacro   display   "setdefa\>"              contained
syn   match   apdlMacro   display   "setlast\>"              contained
syn   match   apdlMacro   display   "shell_my\>"             contained
syn   match   apdlMacro   display   "shellenvpeak\>"         contained
syn   match   apdlMacro   display   "shownpres\>"            contained
syn   match   apdlMacro   display   "sigdig\>"               contained
syn   match   apdlMacro   display   "silent_lssolve\>"       contained
syn   match   apdlMacro   display   "slicexy\>"              contained
syn   match   apdlMacro   display   "slicexz\>"              contained
syn   match   apdlMacro   display   "sliceyz\>"              contained
syn   match   apdlMacro   display   "sm_pilesup_retwall\>"   contained
syn   match   apdlMacro   display   "smdbackup\>"            contained
syn   match   apdlMacro   display   "smdrestore\>"           contained
syn   match   apdlMacro   display   "snext\>"                contained
syn   match   apdlMacro   display   "sprev\>"                contained
syn   match   apdlMacro   display   "sprsup\>"               contained
syn   match   apdlMacro   display   "steel\>"                contained
syn   match   apdlMacro   display   "steellaw\>"             contained
syn   match   apdlMacro   display   "stlplate\>"             contained
syn   match   apdlMacro   display   "stlthsx\>"              contained
syn   match   apdlMacro   display   "stpfnc\>"               contained
syn   match   apdlMacro   display   "stringp\>"              contained
syn   match   apdlMacro   display   "strset\>"               contained
syn   match   apdlMacro   display   "sub2disc\>"             contained
syn   match   apdlMacro   display   "subdir\>"               contained
syn   match   apdlMacro   display   "subdrtst\>"             contained
syn   match   apdlMacro   display   "sugatt\>"               contained
syn   match   apdlMacro   display   "sulocal\>"              contained
syn   match   apdlMacro   display   "sumnforce\>"            contained
syn   match   apdlMacro   display   "takepic\>"              contained
syn   match   apdlMacro   display   "tbl2arr\>"              contained
syn   match   apdlMacro   display   "thrmcnclaw\>"           contained
syn   match   apdlMacro   display   "thrmstllaw\>"           contained
syn   match   apdlMacro   display   "transmatrix\>"          contained
syn   match   apdlMacro   display   "unitpth\>"              contained
syn   match   apdlMacro   display   "upfctcalc\>"            contained
syn   match   apdlMacro   display   "vbackup\>"              contained
syn   match   apdlMacro   display   "vcast\>"                contained
syn   match   apdlMacro   display   "vcastms\>"              contained
syn   match   apdlMacro   display   "vcelu\>"                contained
syn   match   apdlMacro   display   "vcelums\>"              contained
syn   match   apdlMacro   display   "vcoctms\>"              contained
syn   match   apdlMacro   display   "view1w\>"               contained
syn   match   apdlMacro   display   "view2w\>"               contained
syn   match   apdlMacro   display   "view4w\>"               contained
syn   match   apdlMacro   display   "vlims\>"                contained
syn   match   apdlMacro   display   "vmfun\>"                contained
syn   match   apdlMacro   display   "vrestore\>"             contained
syn   match   apdlMacro   display   "vslices\>"              contained
syn   match   apdlMacro   display   "vslicexz\>"             contained
syn   match   apdlMacro   display   "vsliceyz\>"             contained
syn   match   apdlMacro   display   "vwpslicexy\>"           contained
syn   match   apdlMacro   display   "vwpslicexz\>"           contained
syn   match   apdlMacro   display   "vwpsliceyz\>"           contained
syn   match   apdlMacro   display   "wincln\>"               contained
syn   match   apdlMacro   display   "windefa\>"              contained
syn   match   apdlMacro   display   "wintitle\>"             contained
syn   match   apdlMacro   display   "wnlayout\>"             contained
syn   match   apdlMacro   display   "wpslicexy\>"            contained
syn   match   apdlMacro   display   "wpslicexys\>"           contained
syn   match   apdlMacro   display   "wpslicexz\>"            contained
syn   match   apdlMacro   display   "wpsliceyz\>"            contained
syn   match   apdlMacro   display   "wpsliceyzs\>"           contained
syn   match   apdlMacro   display   "wpzero\>"               contained
syn   match   apdlMacro   display   "writecsa\>"             contained
syn   match   apdlMacro   display   "wrvar\>"                contained

" multiline commands
syn region apdlFormatLine start="^" skip="%/&$" end="$" contained
syn match apdlBeforeLine ".*" contained nextgroup=apdlFormatLine skipnl transparent
syn match apdlFunction "\*msg\>" contained nextgroup=apdlBeforeLine
syn match apdlFunction "\*mwrite\>" contained nextgroup=apdlBeforeLine
syn match apdlFunction "\*vread\>" contained nextgroup=apdlBeforeLine
syn match apdlFunction "\*vwrite\>" contained nextgroup=apdlBeforeLine

" special apdl commands that should be highlighted seperately:
syn match	apdlConditional	display	"\*if\>" contained
syn match	apdlConditional	display	"\*elseif\>" contained
syn match	apdlConditional	display	"\*else\>" contained
syn match	apdlConditional	display	"\*endif\>" contained
syn match	apdlRepeat	display "\*do\>" contained
syn match	apdlRepeat	display "\*cycle\>" contained
syn match	apdlRepeat	display "\*exit\>" contained
syn match	apdlRepeat	display "\*enddo\>" contained
syn match	apdlRepeat	display "\*repeat\>" contained
syn match	apdlRepeat	display "\*go\>" contained
syn match apdlRepeat  display "\*dowhile\>" contained

" unknown commands:
syn match	apdlUnknown	display "debug\>" contained
syn match	apdlUnknown	display "/opt\>" contained
syn match	apdlUnknown	display "/runst\>" contained

" anything after /eof
syn region apdlInaccessible start="^" end="%$" contained
" syn match apdlEofLine ".*" contained nextgroup=apdlInaccessible transparent skipnl
" syn match	apdlEof	/\v\/eof$/ contained nextgroup=apdlEofLine
" syn match	apdlEof	/\v\/exit$/ contained nextgroup=apdlEofLine
syn match	apdlEof	"/eof\>" contained nextgroup=apdlInaccessible skipwhite skipnl
syn match	apdlEof	"/exit\>" contained nextgroup=apdlInaccessible skipwhite skipnl

" labels: what is an APDL label?
"syn match	apdlLabel	display ":\s*[a-zA-Z_][a-zA-Z0-9_]*" contained

" apdl command groups

" commands must be the first entry in a line or behind an $
syn cluster	apdlToken contains=apdlConditional,apdlDisplay,apdlEof,apdlFunction,apdlMacro,apdlProcessor,apdlRepeat,apdlSelection,apdlUnknown

syn match	apdlStart1	"\$" nextgroup=@apdlToken skipwhite transparent
syn match	apdlStart2	"^" nextgroup=@apdlToken,apdlNumber,apdlFloat,apdlGetFunction,apdlParametricFunction,apdlString,apdlArgParameters,apdlParameterSubstitution skipwhite transparent

" comment must be the last match, it has priority over apdlStart2
syn keyword	apdlTodo	contained TODO FIXME XXX
syn match	apdlSpecialComment	"!!.*$" contains=apdlTodo
syn match	apdlComment	"![^!].*$" contains=apdlTodo
syn match	apdlComment	"!$"

syn case match
" End of APDL specific part
""""""""""""""""""""""""""""""""""""""""

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_apdl_syntax_inits")
  if version < 508
    let did_apdl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink apdlConditional           Conditional
  HiLink apdlDisplay               Label
  HiLink apdlEof                   Underlined
  HiLink apdlFunction              Function
  HiLink apdlMacro                 Macro
  HiLink apdlProcessor             PreProc
  HiLink apdlRepeat                Repeat
  HiLink apdlSelection             Statement
  HiLink apdlUnknown               Debug

  HiLink apdlFloat                 Float
  HiLink apdlNumber                Number
  HiLink apdlGetFunction           Operator
  HiLink apdlParametricFunction    Operator
  HiLink apdlString                String

  HiLink apdlArgParameters         Keyword
  HiLink apdlComma                 Delimiter
  HiLink apdlFormatLine            Special
  HiLink apdlParameterSubstitution Identifier

  HiLink apdlComment               Comment
  HiLink apdlSpecialComment        SpecialComment
  HiLink apdlTodo                  Todo

  HiLink apdlInaccessible          Error

  delcommand HiLink
endif

let b:current_syntax = "apdl"

