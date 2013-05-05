class TimelineController < ApplicationController
  # Got this timeline from https://github.com/prashishh/Facebook-like-Timeline

  def show
    # @timeline_events = []
    # @timeline_events << {header: "First drafts for website", 
    #                      content: "", 
    #                      picture: nil, date: Date.new(2013,02,13)
    #                     }
    # @timeline_events << {header: "Brainstorming about WeCollaborate", 
    #                      content: "start brainstorm sessions with all kind of people about what WeCollaborate should look like", 
    #                      picture: nil, date: Date.new(2013,02,20)
    #                     }
    # @timeline_events << {header: "Start development", 
    #                      content: "start development website", 
    #                      picture: nil, date: Date.new(2013,02,26)
    #                     }
    # @timeline_events << {header: "Start first project", 
    #                      content: "start first project about windmills.<br>TEST project.", 
    #                      picture: nil, date: Date.new(2013,02,27)
    #                     }
    @timeline_events = Timeline.all 
    @activities = Timeline.activities(current_user)          
  end
end
