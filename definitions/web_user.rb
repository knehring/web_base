define :web_user,
  :comment  => "Web User",
  :gid      => nil,
  :shell    => "/bin/bash",
  :home     => nil,
  :ssh_keys => Array.new,
  :action   => :enable do


    #take incoming variable from param hash and assign them for using later
    username = params[:name]
    comment  = params[:comment]
    gid      = params[:gid]
    shell    = params[:shell]
    ssh_keys = params[:ssh_keys]
    home     ||= "/home/#{params[:name]}"

    #actions to be performed if the create action is specified in the user hash
    if params[:action] == :create

      #create user
      user username do
        supports :manage_home => true
        comment comment
        gid gid
        home home
        shell shell
      end

      #creates users ssh directory with proper permissions
      directory "#{home}/.ssh" do
        owner username
        group gid
        mode "0700"
      end

      #if an ssh key is specified in the keys array, join them by newline and drop them off in the appropriate locations
      if ssh_keys.any?
        file "#{home}/.ssh/authorized_keys" do
          owner username
          group gid
          mode "0600"
          content ssh_keys.join('\n')
        end
      end

      #actions to be perfroemd in the remove action is specified in the user has
    elsif params[:action] == :remove

      #remove user
      user username do
        action :remove
        supports :manage_home => true
        comment comment
        gid gid
        home home
        shell shell
      end

    end
  end

