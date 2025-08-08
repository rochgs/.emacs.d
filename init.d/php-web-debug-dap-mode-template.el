(dap-register-debug-template "PHP Web Debug"
  (list :type "php"
        :request "launch"
        :name "PHP Web Debug"
        :program nil
        :cwd nil
        :port 9003
        :pathMappings (ht ("/var/www/html" "/home/rochgs/Code/web"))))
