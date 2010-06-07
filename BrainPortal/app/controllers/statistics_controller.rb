#
# CBRAIN Project
#
# Controller for Statistics
#
# Original author: Angela McCloskey
#
# $Id$
#
class StatisticsController < ApplicationController

  Revision_info = "$Id$"
  
  before_filter :login_required

  # GET /statistics
  # GET /statistics.xml
  def index #:nodoc:
    @stats_user = Statistic.find(:all, :conditions => {:user_id => current_user.id})
    @task_names = @stats_user.map { |stat| stat.task_name } | []
    @stats_total_user = Statistic.total_task_user(current_user.id)
    @bourreaux = Bourreau.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @statistics }
    end
  end

  # GET /statistics/1
  # GET /statistics/1.xml
  def show #:nodoc:
    @bourreau = Bourreau.find(params[:id])
    @task_stats = Statistic.bourreau_stats(@bourreau.id) 
    @bourreau_total = @task_stats["total_count_bourreau"]
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @statistic }
    end
  end
  
end
