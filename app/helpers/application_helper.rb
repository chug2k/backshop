module ApplicationHelper
  def get_slang_for(word)
    if word == :said
      return ['jibed', 'razzed', 'proferred', 'articulated', 'philosophized'].sample
    end
  end

  def activate_button(cur_name, matched_name)
    'ui-btn-active' if cur_name == matched_name
  end
end
