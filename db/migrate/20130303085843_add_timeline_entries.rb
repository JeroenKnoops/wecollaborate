class AddTimelineEntries < ActiveRecord::Migration
  def up
    @timeline_events = []
    @timeline_events << {title: "First drafts for website", 
                         description: "", 
                         timestamp: Date.new(2013,02,13)
                        }
    @timeline_events << {title: "Brainstorming about WeCollaborate", 
                         description: "start brainstorm sessions with all kind of people about what WeCollaborate should look like", 
                         timestamp: Date.new(2013,02,20)
                        }
    @timeline_events << {title: "Start development", 
                         description: "start development website", 
                         timestamp: Date.new(2013,02,26)
                        }
    @timeline_events << {title: "Start first project", 
                         description: "start first project about windmills.<br>TEST project.", 
                         timestamp: Date.new(2013,02,27)
                        }
    @timeline_events.each do |te|
      Timeline.create te
    end                      
  end

  def down
  end
end
