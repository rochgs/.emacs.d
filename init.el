(add-to-list 'load-path "~/.emacs.d/init.d/")
(load-library "behaviour.el")
(load-library "packages.el")
(load-library "modes.el")
(load-library "appearance.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-intelephense-files-associations ["*.php" "*.phtml" "*.module" "*.inc"])
 '(lsp-intelephense-files-exclude
   ["**/.git/**" "**/.svn/**" "**/.hg/**" "**/CVS/**" "**/.DS_Store/**"
    "**/node_modules/**" "**/bower_components/**"])
 '(lsp-intelephense-stubs
   ["apache" "bcmath" "bz2" "calendar" "com_dotnet" "Core" "ctype" "curl" "date"
    "dba" "dom" "enchant" "exif" "fileinfo" "filter" "fpm" "ftp" "gd" "hash"
    "iconv" "imap" "interbase" "intl" "json" "ldap" "libxml" "mbstring" "mcrypt"
    "meta" "mssql" "mysqli" "oci8" "odbc" "openssl" "pcntl" "pcre" "PDO"
    "pdo_ibm" "pdo_mysql" "pdo_pgsql" "pdo_sqlite" "pgsql" "Phar" "posix"
    "pspell" "readline" "recode" "Reflection" "regex" "session" "shmop"
    "SimpleXML" "snmp" "soap" "sockets" "sodium" "SPL" "sqlite3" "standard"
    "superglobals" "sybase" "sysvmsg" "sysvsem" "sysvshm" "tidy" "tokenizer"
    "wddx" "xml" "xmlreader" "xmlrpc" "xmlwriter" "Zend OPcache" "zip" "zlib"
    "random"])
 '(package-selected-packages '(helm spacemacs-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
