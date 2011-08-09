module EntriesHelper
  def switch_entry_mode_link new_entry_mode
    is_link_to_current_mode = @entry_mode == new_entry_mode.downcase.to_sym
    
    content_tag(:li, :class => (is_link_to_current_mode ? "current" : nil)) do 
      destination = tracker_entries_path(@tracker, :entry_mode => new_entry_mode.downcase.to_sym)
      link_to(new_entry_mode, destination, :id => new_entry_mode.downcase)
    end
  end
  
  def labelled_number_field name
    content_tag(:li, :class => 'required') do
      label_tag(name.downcase.to_sym, name) +
      number_field_tag(name.downcase.to_sym, nil, :min => '0', :step => '0.1', "data-behaviours" => :calculate_points_from_nutritional_information)
    end
  end
end
