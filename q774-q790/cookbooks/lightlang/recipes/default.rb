execute "update apt package" do
  command "apt-get update"
end
%w{figlet perl ruby python}.each do |each_package|
  package each_package do
    action :install
    options "--force-yes"
  end
end
execute "hello ll language" do
  command <<-EOS
cat <<EOF>$HOME/hello.bash
echo 'hello' | xargs figlet
perl -e 'print "perl\n"' | xargs figlet
ruby -e 'print "ruby\n"' | xargs figlet
python -c 'print("python")' | xargs figlet
EOF
  EOS
end
