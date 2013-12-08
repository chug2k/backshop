module ApplicationHelper
  def get_slang_for(word)
    if word == :said
      return ['jibed', 'razzed', 'proferred', 'articulated', 'philosophized'].sample
    end
  end
end
