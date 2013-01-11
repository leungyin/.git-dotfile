### Sample Settings

# aliases
# in this example you can open extensions page by the command ':ext'
# and Chrome's option page by the command ':option'
alias ext TabOpenNew chrome://extensions/
alias opt TabOpenNew chrome://settings/browser
alias down TabOpenNew chrome://downloads
alias his TabOpenNew chrome://history

# mappings for opening your favorite web page
nmap <Space>wb :TabOpenNew http://www.weibo.com/lmx07
nmap <Space>db :TabOpenNew http://www.douban.com
nmap <Space>rd :TabOpenNew http://www.xianguo.com/reader
nmap <Space>gr :TabOpenNew http://www.google.com/reader
nmap <Space>gm :TabOpenNew https://mail.google.com/mail/#inbox
nmap <Space>m :TabOpenNew http://mail.163.com
nmap <Space>qq :TabOpenNew http://web.qq.com
nmap <Space>cs :TabOpenNew http://blog.csdn.net/lalor


nmap W :Readability
# F for continuous f-Mode
# this is recomended setting but commented out by default.
# if you want to use this setting, use the following
#nmap F :GoFMode --newtab --continuous

# you can use <DISCARD> to discard the key so that chrome's default
# action isn't triggered.
#nmap <BS> <DISCARD>

# if you want to change the key used to escape EmergencyMode mode,
# use emap like the following
#emap <ESC> :Escape

## pagecmd offers you page specific key mapping.
# in this example you can use <C-l>, <C-h> for moving between tabs
# on all web pages regardless of your ignored list setting
# because pagecmd has higher priority than ignored URLs.
pagecmd * nmap L :TabFocusNext
pagecmd * nmap H :TabFocusPrev

pagecmd * nmap l :TabFocusNext
pagecmd * nmap h :TabFocusPrev

# almost all Vichrome functions don't work properly for pdf contents
# so it's useful to enable default key bindings for pdf file.
pagecmd *.pdf nmap <C-f> <NOP>

# if you want to use twitter web's key binding, write settings like below
#pagecmd http*://twitter.com/* nmap f <NOP>
#pagecmd http*://twitter.com/* nmap r <NOP>
