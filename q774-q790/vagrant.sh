vagrant ssh-config --host codeiq_test  >> ./codeiq_sshconfig
#ssh -F ./codeiq_sshconfig codeiq_test
knife solo prepare -F ./codeiq_sshconfig codeiq_test
knife solo cook -F ./codeiq_sshconfig codeiq_test
