class ServersController < ApplicationController
  def index    
    @server_groups = Server.all.order(:server_order).group_by{|s| s.server_group }.sort_by{|group, servers| group}
  end

  def assign_person
    server = Server.find_by_id(params[:id])
    if params[:person_id].blank?
      server.person_id = nil
    else
      server.person_id = params[:person_id]
    end
    server.save

    redirect_to action: :index
  end

  def delete_server
    Server.find_by_id(params[:id]).destroy
    redirect_to action: :index
  end

  def delete_repo
    Repo.find_by_id(params[:id]).destroy
    redirect_to action: :index
  end

  def snitch
    server = Server.find_by_server_name(params[:server_name])
    if !server
      server = Server.new(server_name: params[:server_name])
    end
    server.server_group = params[:server_group]
    server.server_order = params[:server_order]

    if !server.save()
      puts server.errors.full_messages.join(", ")
    end

    repo = Repo.where(server_id: server.id, repo_name: params[:branch_label]).first
    if !repo
      repo = Repo.new(repo_name: params[:branch_label], server_id: server.id)
    end
    repo.current_branch_name = params[:branch_name]
    repo.current_branch_status = params[:branch_status]
    repo.current_branch_log = params[:branch_log]

    if !repo.save()
      puts server.id
      puts repo.errors.full_messages.join(", ")
    end

    render json: {
      status: :success
    }
  end
end

