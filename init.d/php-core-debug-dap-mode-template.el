(dap-register-debug-template "PHP Core Debug"
  (list :type "php"
        :request "launch"
        :name "PHP Core Debug"
        :program nil
        :cwd nil
        :port 9003
        :pathMappings (ht ("/var/www/html" "/home/rochgs/Code/core"))))
